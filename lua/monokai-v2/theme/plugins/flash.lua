local M = {}

---@param c Colorscheme
---@param config Config
---@param hp Helper
function M.get(c, config, hp)
  return {
    FlashCurrent = { fg = c.base.yellow, bold = true },
    FlashMatch = { fg = c.base.green, bold = true },
    FlashBackdrop = { fg = c.base.dimmed4 },
    FlashLabel = { fg = c.base.orange },
  }
end

return M
