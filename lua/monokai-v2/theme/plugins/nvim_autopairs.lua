local M = {}

---@param c Colorscheme
---@param config Config
---@param hp Helper
function M.get(c, config, hp)
  return {
    AutoPairsInsert = { fg = c.base.green },
    AutoPairsDelete = { fg = c.base.red },
    AutoPairsMatched = { fg = c.base.yellow, bold = true },
  }
end

return M
