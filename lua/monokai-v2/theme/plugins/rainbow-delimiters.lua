local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    RainbowDelimiterRed = { fg = c.punctuation.delimiter.pink or c.base.pink },
    RainbowDelimiterYellow = { fg = c.punctuation.delimiter.yellow or c.base.yellow },
    RainbowDelimiterBlue = { fg = c.punctuation.delimiter.blue or c.base.cyan },
    RainbowDelimiterOrange = { fg = c.punctuation.delimiter.orange or c.base.orange },
    RainbowDelimiterGreen = { fg = c.punctuation.delimiter.green or c.base.green },
    RainbowDelimiterViolet = { fg = c.punctuation.delimiter.purple or c.base.purple },
    RainbowDelimiterCyan = { fg = c.punctuation.delimiter.cyan or c.base.cyan },
  }
end

return M
