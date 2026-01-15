local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    CopilotSuggestion = { fg = c.base.dimmed1, italic = true },
    CopilotAnnotation = { fg = c.base.dimmed1, italic = true },
  }
end

return M
