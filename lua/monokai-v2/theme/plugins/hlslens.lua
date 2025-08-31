local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  return {
    HlSearchNear = { fg = c.base.black, bg = c.base.yellow, bold = true },
    HlSearchLens = { fg = c.base.cyan, bg = hp.blend(c.base.cyan, 0.1, c.editor.background) },
    HlSearchLensNear = { fg = c.base.orange, bg = hp.blend(c.base.orange, 0.1, c.editor.background) },
  }
end

return M
