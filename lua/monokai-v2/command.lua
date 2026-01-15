local util = require("monokai-v2.util")
local config = require("monokai-v2.config")

local M = {}

M.create_filter_command = function()
  local cmd = vim.api.nvim_create_user_command

  cmd("MonokaiThemeSelect", function()
    local filters = {
      "classic",
      "light",
      "machine",
      "octagon",
      "pro",
      "ristretto",
      "spectrum",
    }
    local menu = util.ui.create_menu("Set monokai filter", filters, function(item)
      local value = item and (item.value or item)
      if not value then
        return
      end
      config.extend({ filter = value })
      vim.cmd([[colorscheme monokai-v2]])
    end)
    if menu then
      menu:mount()
    else
      vim.ui.select(filters, { prompt = "Monokai theme filter" }, function(choice)
        if not choice then
          return
        end
        config.extend({ filter = choice })
        vim.cmd([[colorscheme monokai-v2]])
      end)
    end
  end, { nargs = 0 })

  cmd("MonokaiChoose", function(opts)
    local filter = opts.args
    config.extend({ filter = filter })
    vim.cmd([[colorscheme monokai-v2]])
  end, {
    nargs = 1,
    complete = function()
      return {
        "classic",
        "light",
        "machine",
        "octagon",
        "pro",
        "ristretto",
        "spectrum",
      }
    end,
  })
end

M.create_cache_commands = function()
  local cmd = vim.api.nvim_create_user_command

  cmd("MonokaiCompile", function()
    require("monokai-v2.cache").clear()
    -- Reloading the theme will trigger generation and caching
    vim.cmd([[colorscheme monokai-v2]])
    vim.notify("Monokai-v2: Theme compiled and cached!", vim.log.levels.INFO)
  end, { nargs = 0 })

  cmd("MonokaiClear", function()
    require("monokai-v2.cache").clear()
    vim.notify("Monokai-v2: Cache cleared!", vim.log.levels.INFO)
  end, { nargs = 0 })

  -- Command to manually refresh semantic tokens for the current buffer
  cmd("MonokaiRefreshTokens", function()
    local bufnr = vim.api.nvim_get_current_buf()
    if vim.api.nvim_buf_is_valid(bufnr) then
      local ok, err = pcall(vim.lsp.semantic_tokens.force_refresh, bufnr)
      if ok then
        vim.notify("Monokai-v2: Semantic tokens refreshed!", vim.log.levels.INFO)
      else
        vim.notify("Monokai-v2: Failed to refresh semantic tokens: " .. tostring(err), vim.log.levels.WARN)
      end
    end
  end, { nargs = 0 })
end

return M

