local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    Beacon = { bg = c.base.orange },
  }
end

return M
