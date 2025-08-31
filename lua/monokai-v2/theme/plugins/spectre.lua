local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  return {
    SpectreSearch = { fg = c.base.yellow, bg = hp.blend(c.base.yellow, 0.1, c.editor.background) },
    SpectreReplace = { fg = c.base.green, bg = hp.blend(c.base.green, 0.1, c.editor.background) },
    SpectreFile = { fg = c.base.blue },
    SpectreUI = { fg = c.editor.foreground },
  }
end

return M
