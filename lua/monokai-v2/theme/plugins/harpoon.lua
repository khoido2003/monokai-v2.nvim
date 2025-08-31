local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  return {
    HarpoonWindow = { fg = c.editor.foreground, bg = c.editor.background },
    HarpoonBorder = { fg = c.base.dimmed2, bg = c.editor.background },
    HarpoonCurrent = { fg = c.base.yellow, bold = true },
    HarpoonInactive = { fg = c.base.dimmed1 },
  }
end

return M
