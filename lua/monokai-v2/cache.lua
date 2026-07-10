local M = {}
local cache_dir = vim.fn.stdpath("cache") .. "/monokai-v2"

-- Ensure cache directory exists
local function ensure_dir()
  if vim.fn.isdirectory(cache_dir) == 0 then
    vim.fn.mkdir(cache_dir, "p")
  end
end

function M.get_cache_path(filter)
  return string.format("%s/compiled_%s.lua", cache_dir, filter)
end

-- Generate a hash/signature for the config to invalidate cache on changes
local function get_config_state(config)
  local state = {}
  -- Handle proxy table from config module
  local c = type(config.get) == "function" and config.get() or config
  for k, v in pairs(c) do
    if type(v) ~= "function" and k ~= "overridePalette" and k ~= "overrideScheme" then
      state[k] = v
    end
  end
  return state
end

function M.compile(filter, hl_groups, config)
  ensure_dir()
  local theme_util = require("monokai-v2.util.theme")
  local path = M.get_cache_path(filter)
  local config_state = get_config_state(config)

  local lines = {
    "local M = {}",
    string.format("M.config = %s", vim.inspect(config_state)),
    "M.load = function()",
    "  if vim.g.colors_name then vim.cmd('hi clear') end",
    "  vim.o.termguicolors = true",
    "  vim.g.colors_name = 'monokai-v2'",
    string.format("  vim.o.background = '%s'", config.filter == "light" and "light" or "dark"),
  }

  for group, opts in pairs(hl_groups) do
    if type(opts) == "table" then
      local resolved = theme_util.resolve_highlight(opts)

      local parts = {}
      if resolved.fg then
        table.insert(parts, string.format('fg = "%s"', resolved.fg))
      end
      if resolved.bg then
        table.insert(parts, string.format('bg = "%s"', resolved.bg))
      end
      if resolved.sp then
        table.insert(parts, string.format('sp = "%s"', resolved.sp))
      end
      if resolved.link then
        table.insert(parts, string.format('link = "%s"', resolved.link))
      end

      local bool_keys = {
        "bold",
        "italic",
        "underline",
        "undercurl",
        "underdouble",
        "underdotted",
        "underdashed",
        "strikethrough",
        "reverse",
        "nocombine",
      }
      for _, key in ipairs(bool_keys) do
        if resolved[key] then
          table.insert(parts, key .. " = true")
        end
      end

      if #parts > 0 then
        table.insert(lines, string.format('  vim.api.nvim_set_hl(0, "%s", { %s })', group, table.concat(parts, ", ")))
      end
    end
  end

  if config.terminal_colors or config.devicons then
    local colorscheme = require("monokai-v2.colorscheme")(config.filter)

    if config.terminal_colors then
      table.insert(lines, string.format("  vim.g.terminal_color_0 = '%s'", colorscheme.base.black))
      table.insert(lines, string.format("  vim.g.terminal_color_8 = '%s'", colorscheme.base.dimmed3))
      table.insert(lines, string.format("  vim.g.terminal_color_7 = '%s'", colorscheme.base.white))
      table.insert(lines, string.format("  vim.g.terminal_color_15 = '%s'", colorscheme.base.white))
      table.insert(lines, string.format("  vim.g.terminal_color_1 = '%s'", colorscheme.base.red))
      table.insert(lines, string.format("  vim.g.terminal_color_9 = '%s'", colorscheme.base.red))
      table.insert(lines, string.format("  vim.g.terminal_color_2 = '%s'", colorscheme.base.green))
      table.insert(lines, string.format("  vim.g.terminal_color_10 = '%s'", colorscheme.base.green))
      table.insert(lines, string.format("  vim.g.terminal_color_3 = '%s'", colorscheme.base.yellow))
      table.insert(lines, string.format("  vim.g.terminal_color_11 = '%s'", colorscheme.base.yellow))
      table.insert(lines, string.format("  vim.g.terminal_color_4 = '%s'", colorscheme.base.orange))
      table.insert(lines, string.format("  vim.g.terminal_color_12 = '%s'", colorscheme.base.orange))
      table.insert(lines, string.format("  vim.g.terminal_color_5 = '%s'", colorscheme.base.purple))
      table.insert(lines, string.format("  vim.g.terminal_color_13 = '%s'", colorscheme.base.purple))
      table.insert(lines, string.format("  vim.g.terminal_color_6 = '%s'", colorscheme.base.cyan))
      table.insert(lines, string.format("  vim.g.terminal_color_14 = '%s'", colorscheme.base.cyan))
    end

    if config.devicons then
      local icons = require("monokai-v2.devicons").get_icons(colorscheme)
      if icons then
        local icons_str = vim.inspect(icons)
        local devicons_path = string.format("%s/compiled_%s_devicons.lua", cache_dir, filter)
        local devicons_lines = {
          "return function()",
          "  local ok, web_devicons = pcall(require, 'nvim-web-devicons')",
          "  if ok then",
          string.format("    web_devicons.set_icon(%s)", icons_str),
          "  end",
          "end",
        }
        local df = io.open(devicons_path, "w")
        if df then
          df:write(table.concat(devicons_lines, "\n"))
          df:close()
        end

        table.insert(
          lines,
          string.format(
            [[
  vim.schedule(function()
    local f = loadfile("%s")
    if f then pcall(f()) end
  end)
]],
            devicons_path:gsub("\\", "/")
          )
        )
      end
    end
  end

  if hl_groups["BufferLineFill"] then
    local sel = theme_util.resolve_highlight(vim.deepcopy(hl_groups["BufferLineInfoSelected"] or {}))
    local inact = theme_util.resolve_highlight(vim.deepcopy(hl_groups["BufferLineInfo"] or {}))
    local vis = theme_util.resolve_highlight(vim.deepcopy(hl_groups["BufferLineInfoVisible"] or {}))

    local function fmt_hl(state)
      local parts = {}
      if state.bg then
        table.insert(parts, 'bg = "' .. state.bg .. '"')
      end
      if state.underline then
        table.insert(parts, "underline = true")
      end
      if state.sp then
        table.insert(parts, 'sp = "' .. state.sp .. '"')
      end
      return table.concat(parts, ", ")
    end

    local autocmd = string.format(
      [[
  vim.api.nvim_create_autocmd({"ColorScheme", "BufEnter"}, {
    group = vim.api.nvim_create_augroup("MonokaiV2BufferlineIcons", { clear = true }),
    callback = function(args)
      if vim.g.colors_name ~= "monokai-v2" then return end
      vim.schedule(function()
        local ok, web_devicons = pcall(require, "nvim-web-devicons")
        if not ok then return end
        local bufs = args.event == "BufEnter" and {args.buf} or vim.api.nvim_list_bufs()
        for _, buf_id in ipairs(bufs) do
          pcall(function()
            if not vim.api.nvim_buf_is_valid(buf_id) then return end
            local buf_name = vim.api.nvim_buf_get_name(buf_id)
            if buf_name and buf_name ~= "" then
              local filename = vim.fn.fnamemodify(buf_name, ":t")
              local extension = vim.fn.fnamemodify(buf_name, ":e")
              local _, icon_hl = web_devicons.get_icon(filename, extension, { default = true })
              local _, icon_color = web_devicons.get_icon_color(filename, extension, { default = true })
              if icon_hl then
                vim.api.nvim_set_hl(0, "BufferLine" .. icon_hl .. "Selected", { fg = icon_color, %s })
                vim.api.nvim_set_hl(0, "BufferLine" .. icon_hl, { fg = icon_color, %s })
                vim.api.nvim_set_hl(0, "BufferLine" .. icon_hl .. "Inactive", { fg = icon_color, %s })
              end
            end
          end)
        end
      end)
    end,
  })
]],
      fmt_hl(sel),
      fmt_hl(inact),
      fmt_hl(vis)
    )

    table.insert(lines, autocmd)
  end

  table.insert(lines, "  vim.schedule(function()")
  table.insert(lines, '    pcall(require, "monokai-v2.autocmds")')
  table.insert(lines, '    local ok, cmd = pcall(require, "monokai-v2.command")')
  table.insert(lines, "    if ok then cmd.create_commands() end")
  table.insert(lines, "  end)")

  table.insert(lines, "end")
  table.insert(lines, "return M")

  local file = io.open(path, "w")
  if file then
    file:write(table.concat(lines, "\n"))
    file:close()
  end
end

function M.check_validity(filter, config)
  local path = M.get_cache_path(filter)
  local f = loadfile(path)
  if not f then
    return false
  end
  local ok, cached = pcall(f)
  if not ok or type(cached) ~= "table" or not cached.config then
    return false
  end
  local config_state = get_config_state(config)
  return vim.deep_equal(cached.config, config_state)
end

function M.clear()
  if vim.fn.isdirectory(cache_dir) == 1 then
    vim.fn.delete(cache_dir, "rf")
  end
end

return M
