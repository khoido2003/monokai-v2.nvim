local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  return {
    RestHeader = { fg = c.base.cyan, bold = true },
    RestMethod = { fg = c.base.green },
    RestUrl = { fg = c.base.blue, underline = true },
    RestStatus = { fg = c.base.yellow },
    RestError = { fg = c.base.red, bold = true },
  }
end

return M
