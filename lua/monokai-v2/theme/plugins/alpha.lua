local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    AlphaButton = { fg = c.base.purple },
    AlphaFooter = { fg = c.base.orange },
    AlphaHeader = { fg = c.base.yellow },
  }
end

return M
