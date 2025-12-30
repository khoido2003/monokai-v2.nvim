local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    RenderMarkdownH1 = { fg = c.base.red, bold = true },
    RenderMarkdownH2 = { fg = c.base.orange, bold = true },
    RenderMarkdownH3 = { fg = c.base.yellow, bold = true },
    RenderMarkdownH4 = { fg = c.base.green, bold = true },
    RenderMarkdownH5 = { fg = c.base.cyan, bold = true },
    RenderMarkdownH6 = { fg = c.base.purple, bold = true },
    RenderMarkdownCode = { bg = c.base.dimmed5 },
    RenderMarkdownBullet = { fg = c.base.red },
    RenderMarkdownQuote = { fg = c.base.yellow },
    RenderMarkdownTableHead = { fg = c.base.cyan },
    RenderMarkdownTableRow = { fg = c.base.white },
    RenderMarkdownSuccess = { fg = c.base.green },
    RenderMarkdownInfo = { fg = c.base.cyan },
    RenderMarkdownWarn = { fg = c.base.orange },
    RenderMarkdownError = { fg = c.base.red },
  }
end

return M
