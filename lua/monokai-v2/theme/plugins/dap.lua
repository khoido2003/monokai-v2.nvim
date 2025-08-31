local M = {}

---@param c Colorscheme
---@param config Config
---@param hp Helper
function M.get(c, config, hp)
  return {
    DapBreakpoint = { fg = c.base.red, bold = true },
    DapStopped = { fg = c.base.green, bold = true },
    DapBreakpointCondition = { fg = c.base.orange },
    DapLogPoint = { fg = c.base.purple },
    DapBreakpointRejected = { fg = c.base.dimmed3 },
    DapBreakpointLine = { bg = hp.blend(c.base.red, 0.1, c.editor.background) },
  }
end

return M
