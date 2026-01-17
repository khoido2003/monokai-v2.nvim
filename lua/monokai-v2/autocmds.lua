-- Monokai-v2 autocmds
local M = {}

local timer = nil
local augroup = nil
local lsp_augroup = nil

local function check_day_night()
  local config = require("monokai-v2.config")
  if not config.day_night or not config.day_night.enable then
    return
  end

  local util_extra = require("monokai-v2.util.extra")
  local is_day = util_extra.is_daytime()
  local target_filter = is_day and config.day_night.day_filter or config.day_night.night_filter
  local current_filter = require("monokai-v2.colorscheme").filter

  if target_filter ~= current_filter then
    vim.schedule(function()
      pcall(function()
        require("monokai-v2")._load(target_filter)
        -- Notify user about the switch
        vim.notify(
          "Monokai-v2: Switched to " .. target_filter .. " (" .. (is_day and "Day" or "Night") .. ") mode",
          vim.log.levels.INFO
        )
      end)
    end)
  end
end

--- Stop the day/night timer and clean up autocmds
function M.cleanup()
  if timer then
    timer:stop()
    timer:close()
    timer = nil
  end
  if augroup then
    pcall(vim.api.nvim_del_augroup_by_id, augroup)
    augroup = nil
  end
  if lsp_augroup then
    pcall(vim.api.nvim_del_augroup_by_id, lsp_augroup)
    lsp_augroup = nil
  end
end

--- Initialize the day/night timer if enabled
function M.setup()
  local config = require("monokai-v2.config")
  local uv = vim.uv or vim.loop

  -- Clean up any existing timer/autocmds first
  M.cleanup()

  if config.day_night and config.day_night.enable then
    -- Create timer
    timer = uv.new_timer()
    -- Check every 1 hour (3600000 ms)
    timer:start(0, 3600000, vim.schedule_wrap(check_day_night))

    -- Create autocmd to clean up when switching colorschemes
    augroup = vim.api.nvim_create_augroup("MonokaiV2DayNight", { clear = true })
    vim.api.nvim_create_autocmd("ColorSchemePre", {
      group = augroup,
      callback = function()
        -- Only cleanup if switching away from monokai-v2
        vim.schedule(function()
          if vim.g.colors_name ~= "monokai-v2" then
            M.cleanup()
          end
        end)
      end,
    })
  end

  -- Setup LSP semantic token refresh autocmd
  -- This fixes the issue where custom types/classes don't get highlighting
  -- immediately when the LSP first attaches and provides semantic tokens.
  lsp_augroup = vim.api.nvim_create_augroup("MonokaiV2LspSemanticTokens", { clear = true })

  -- Helper function to safely refresh semantic tokens for a buffer
  local function refresh_semantic_tokens(bufnr)
    if vim.api.nvim_buf_is_valid(bufnr) and vim.api.nvim_buf_is_loaded(bufnr) then
      pcall(vim.lsp.semantic_tokens.force_refresh, bufnr)
    end
  end

  -- Debounce timer for BufEnter refreshes
  local debounce_timers = {}

  -- Debounced refresh function to avoid excessive refreshes
  local function debounced_refresh(bufnr, delay)
    -- Cancel any existing timer for this buffer
    if debounce_timers[bufnr] then
      debounce_timers[bufnr]:stop()
      debounce_timers[bufnr]:close()
      debounce_timers[bufnr] = nil
    end

    local uv = vim.uv or vim.loop
    local timer = uv.new_timer()
    debounce_timers[bufnr] = timer

    timer:start(
      delay,
      0,
      vim.schedule_wrap(function()
        refresh_semantic_tokens(bufnr)
        if debounce_timers[bufnr] then
          debounce_timers[bufnr]:stop()
          debounce_timers[bufnr]:close()
          debounce_timers[bufnr] = nil
        end
      end)
    )
  end

  vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_augroup,
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and client.supports_method("textDocument/semanticTokens/full") then
        local bufnr = args.buf

        -- Schedule a few early refreshes for fast LSPs
        -- We rely on LspProgress for the heavy lifting of slow LSPs (like Roslyn)
        local refresh_delays = { 500, 2000 } -- ms

        for _, delay in ipairs(refresh_delays) do
          vim.defer_fn(function()
            refresh_semantic_tokens(bufnr)
          end, delay)
        end
      end
    end,
  })

  -- Listen for LspProgress to detect when LSP finishes work (e.g. Roslyn initialization)
  -- This is the most efficient way to handle slow loading LSPs without polling
  vim.api.nvim_create_autocmd("LspProgress", {
    group = lsp_augroup,
    callback = function(args)
      local data = args.data
      if data and data.params then
        local value = data.params.value
        -- Check if this is an "end" progress message (work completed)
        if value and value.kind == "end" then
          -- Pulse a refresh when work completes
          vim.defer_fn(function()
            local bufnr = vim.api.nvim_get_current_buf()
            if vim.api.nvim_buf_is_valid(bufnr) then
              refresh_semantic_tokens(bufnr)
            end
          end, 500)
        end
      end
    end,
  })

  -- Do NOT refresh semantic tokens on BufEnter.
  -- Neovim already preserves semantic tokens across buffer switches, and
  -- force-refreshing on every switch causes visible flickering. The LspAttach
  -- and LspProgress autocmds above are sufficient to handle initial token
  -- population and slow LSP initialization.
end

-- Auto-initialize when this module is loaded
M.setup()

return M
