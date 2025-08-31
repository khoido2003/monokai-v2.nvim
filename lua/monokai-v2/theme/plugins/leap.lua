local M = {}

---@param c Colorscheme
---@param config Config
---@param hp Helper
function M.get(c, config, hp)
  return {
    LeapLabelPrimary = { fg = c.base.yellow, bold = true },
    LeapLabelSecondary = { fg = c.base.orange },
    LeapMatch = { fg = c.base.green, bold = true },
    LeapBackdrop = { fg = c.base.dimmed3 },
  }
end

return M
