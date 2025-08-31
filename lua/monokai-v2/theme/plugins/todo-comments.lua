local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  return {
    Todo = { fg = c.base.yellow, bold = true },
    TodoFgFIX = { fg = c.base.red, bold = true },
    TodoFgTODO = { fg = c.base.yellow, bold = true },
    TodoFgHACK = { fg = c.base.purple, bold = true },
    TodoFgWARN = { fg = c.base.orange, bold = true },
    TodoFgNOTE = { fg = c.base.cyan, bold = true },
  }
end

return M
