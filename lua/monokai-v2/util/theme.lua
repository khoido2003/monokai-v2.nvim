local Util = require("monokai-v2.util")
local Helper = require("monokai-v2.color_helper")

---@class monokai-v2.util.theme
local M = {}

local function load_autocmds()
  pcall(require, "monokai-v2.autocmds")
end

-- Plugin icon handlers for fixing dynamically-derived devicon backgrounds.
-- Each handler is a function(event: string, bufs: integer[]) that updates
-- highlight groups for the given buffers.
local plugin_icon_handlers = {}
local plugin_icon_autocmd_registered = false

--- Register a plugin-specific icon background fix handler.
--- @param name string
--- @param handler fun(event: string, bufs: integer[])
function M.register_plugin_icon_handler(name, handler)
  plugin_icon_handlers[name] = handler
end

--- Set up a single centralized autocmd that dispatches to all registered
--- plugin icon handlers. BufEnter scopes to the entered buffer only;
--- ColorScheme sweeps all buffers since highlights were cleared.
function M.setup_plugin_icon_autocmds()
  if plugin_icon_autocmd_registered or vim.tbl_isempty(plugin_icon_handlers) then
    return
  end
  plugin_icon_autocmd_registered = true

  local group = vim.api.nvim_create_augroup("MonokaiV2PluginIcons", { clear = true })
  vim.api.nvim_create_autocmd({ "ColorScheme", "BufEnter" }, {
    group = group,
    callback = function(args)
      if vim.g.colors_name ~= "monokai-v2" then
        return
      end

      vim.schedule(function()
        local bufs = args.event == "BufEnter" and { args.buf } or vim.api.nvim_list_bufs()
        for _, handler in pairs(plugin_icon_handlers) do
          pcall(handler, args.event, bufs)
        end
      end)
    end,
  })

  -- Backfill already-open buffers so icons are corrected immediately.
  vim.schedule(function()
    if vim.g.colors_name == "monokai-v2" then
      for _, handler in pairs(plugin_icon_handlers) do
        pcall(handler, "ColorScheme", vim.api.nvim_list_bufs())
      end
    end
  end)
end

---@param hex_color HexColor
---@param base? HexColor
---@return HexColor?
function M.resolve_color(hex_color, base)
  if hex_color == nil or string.len(hex_color) ~= 9 then
    return hex_color
  end

  local filter = require("monokai-v2.colorscheme").filter
  ---@module "monokai-v2.colorscheme.palette.pro"
  local c = require("monokai-v2.colorscheme.palette." .. filter)
  if base == nil then
    base = c.background
  end
  if string.len(base) == 9 then
    base = Helper.extend_hex(base, c.background)
  end
  return Helper.extend_hex(hex_color, base)
end

---@param hl_group_opt HighlightGroupOpt
function M.resolve_highlight(hl_group_opt)
  local bg_value = M.resolve_color(hl_group_opt.bg, hl_group_opt.bg_base)
  local fg_value = M.resolve_color(hl_group_opt.fg, hl_group_opt.fg_base)
  local sp_value = M.resolve_color(hl_group_opt.sp, bg_value)

  hl_group_opt.bg = bg_value
  hl_group_opt.fg = fg_value
  hl_group_opt.sp = sp_value
  hl_group_opt.bg_base = nil
  hl_group_opt.fg_base = nil
  return hl_group_opt
end

---@param group HighlightGroup
---@param hl_group_opt HighlightGroupOpt
local highlight = function(group, hl_group_opt)
  if hl_group_opt.link then
    vim.api.nvim_set_hl(0, group, { link = hl_group_opt.link })
    return
  end

  local hl_value = M.resolve_highlight(hl_group_opt)

  vim.api.nvim_set_hl(0, group, hl_value)
end

---@param hl_group_tbl? HighlightGroupTbl
function M.draw(hl_group_tbl)
  if hl_group_tbl == nil then
    return
  end
  for hl_group, value in pairs(hl_group_tbl) do
    highlight(hl_group, value)
  end
end

---@param hl_group_tbl HighlightGroupTbl
function M.load(hl_group_tbl)
  if vim.g.colors_name then
    vim.cmd([[hi clear]])
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "monokai-v2"

  if require("monokai-v2.colorscheme").filter == "light" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end

  M.draw(hl_group_tbl)

  -- Set up plugin icon autocmds so dynamically-derived devicon backgrounds
  -- (e.g. BufferLineDevIcon*) are corrected for all registered plugins.
  local bufferline_module = require("monokai-v2.theme.plugins.bufferline")
  if bufferline_module.register_icon_handler then
    bufferline_module.register_icon_handler()
  end
  M.setup_plugin_icon_autocmds()
  load_autocmds()
end

return M
