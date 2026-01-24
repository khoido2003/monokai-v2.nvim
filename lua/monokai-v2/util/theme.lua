local Util = require("monokai-v2.util")
local Helper = require("monokai-v2.color_helper")

---@class monokai-v2.util.theme
local M = {}

local function load_autocmds()
  pcall(require, "monokai-v2.autocmds")
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

  -- Note: setup_bufferline_icon() is called by bufferline plugin itself with icon info
  -- This is safe but will return nil/{} since no icon info is provided
  -- The bufferline plugin will call this function directly when it needs icon highlights
  local bufferline_module = require("monokai-v2.theme.plugins.bufferline")
  if bufferline_module.setup_bufferline_icon then
    local bufferline_icon_hl_group_tbl = bufferline_module.setup_bufferline_icon()
    if bufferline_icon_hl_group_tbl then
      M.draw(bufferline_icon_hl_group_tbl)
    end
  end
  load_autocmds()
end

return M
