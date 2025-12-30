local M = {}

---@param c Colorscheme
---@param config Config
---@param hp Helper
function M.get(c, config, hp)
  return {
    FlashBackdrop = { fg = c.base.dimmed4 },
    FlashMatch = { bg = c.base.dimmed4, fg = c.base.white },
    FlashCurrent = { bg = c.base.dimmed4, fg = c.base.yellow, bold = true },
    FlashLabel = { bg = c.base.dimmed4, fg = c.base.red, bold = true },
  }
end

return M
