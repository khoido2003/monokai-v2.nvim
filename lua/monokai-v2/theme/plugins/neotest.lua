local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  return {
    NeotestPassed = { fg = c.base.green },
    NeotestFailed = { fg = c.base.red },
    NeotestRunning = { fg = c.base.yellow },
    NeotestSkipped = { fg = c.base.cyan },
    NeotestTarget = { fg = c.base.orange },
    NeotestNamespace = { fg = c.base.purple, bold = true },
  }
end

return M
