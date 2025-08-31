local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  return {
    DapUIVariable = { fg = c.base.cyan },
    DapUIScope = { fg = c.base.purple, bold = true },
    DapUIType = { fg = c.base.yellow },
    DapUIValue = { fg = c.editor.foreground },
    DapUIStoppedThread = { fg = c.base.green },
    DapUIThread = { fg = c.base.blue },
    DapUIWatchesValue = { fg = c.base.orange },
    DapUIBreakpointsPath = { fg = c.base.cyan },
    DapUIBreakpointsInfo = { fg = c.base.green },
    DapUIBreakpointsCurrentLine = { fg = c.base.yellow, bold = true },
  }
end

return M
