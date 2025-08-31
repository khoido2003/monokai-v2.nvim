local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  return {
    NeorgHeading1 = { fg = c.base.cyan, bold = true },
    NeorgHeading2 = { fg = c.base.green, bold = true },
    NeorgHeading3 = { fg = c.base.yellow, bold = true },
    NeorgHeading4 = { fg = c.base.purple, bold = true },
    NeorgHeading5 = { fg = c.base.orange, bold = true },
    NeorgHeading6 = { fg = c.base.red, bold = true },

    NeorgLink = { fg = c.base.blue, underline = true },
    NeorgMarker = { fg = c.base.dimmed1 },
    NeorgQuote = { fg = c.base.yellow, italic = true },
    NeorgCodeBlock = { fg = c.base.green },
  }
end

return M
