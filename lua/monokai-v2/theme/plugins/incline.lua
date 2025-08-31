local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  return {
    InclineNormal = { fg = c.editor.foreground, bg = c.editor.background },
    InclineNormalNC = { fg = c.base.dimmed1, bg = c.editor.background },
    InclineTitle = { fg = c.base.cyan, bold = true },
    InclineSeparator = { fg = c.base.dimmed2 },
  }
end

return M
