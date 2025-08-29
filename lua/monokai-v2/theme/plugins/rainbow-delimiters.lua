local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    RainbowDelimiterRed = { fg = c.base.red },
    RainbowDelimiterYellow = { fg = c.punctuation.delimiter.yellow or c.base.yellow },
    RainbowDelimiterBlue = { fg = c.punctuation.delimiter.blue or c.base.cyan },
    RainbowDelimiterOrange = { fg = c.punctuation.delimiter.orange or c.base.blue },
    RainbowDelimiterGreen = { fg = c.punctuation.delimiter.green or c.base.green },
    RainbowDelimiterViolet = { fg = c.punctuation.delimiter.purple or c.base.magenta },
    RainbowDelimiterCyan = { fg = c.punctuation.delimiter.cyan or c.base.cyan },
  }
end

return M

