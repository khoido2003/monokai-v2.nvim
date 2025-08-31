local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  return {
    DropBarNormal = { fg = c.editor.foreground, bg = c.editor.background },
    DropBarHover = { fg = c.base.yellow, bg = hp.blend(c.base.yellow, 0.15, c.editor.background) },
    DropBarIcon = { fg = c.base.cyan },
    DropBarSeparator = { fg = c.base.dimmed2 },
  }
end

return M
