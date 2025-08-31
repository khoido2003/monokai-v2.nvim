local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  return {
    OverseerTask = { fg = c.base.cyan },
    OverseerTaskSUCCESS = { fg = c.base.green, bold = true },
    OverseerTaskFAILURE = { fg = c.base.red, bold = true },
    OverseerTaskRUNNING = { fg = c.base.yellow, italic = true },
  }
end

return M
