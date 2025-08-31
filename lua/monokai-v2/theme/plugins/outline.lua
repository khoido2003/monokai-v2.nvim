local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  return {
    OutlineNormal = { fg = c.editor.foreground, bg = c.editor.background },
    OutlineIndentMarker = { fg = c.base.dimmed1 },
    OutlineFoldMarker = { fg = c.base.cyan },
    OutlineCurrentItem = { fg = c.base.yellow, bold = true },
    OutlineSymbol = { fg = c.base.purple },
  }
end

return M
