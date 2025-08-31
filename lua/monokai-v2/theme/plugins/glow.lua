local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  return {
    GlowCodeBlock = { bg = hp.blend(c.base.black, 0.2, c.editor.background), fg = c.editor.foreground },
    GlowHeading = { fg = c.base.magenta, bold = true },
    GlowBullet = { fg = c.base.yellow },
    GlowLink = { fg = c.base.blue, underline = true },
  }
end

return M
