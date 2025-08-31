local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  return {
    YankyPutRegion = { bg = hp.blend(c.base.green, 0.25, c.editor.background) },
    YankyYankedRegion = { bg = hp.blend(c.base.yellow, 0.25, c.editor.background) },
  }
end

return M
