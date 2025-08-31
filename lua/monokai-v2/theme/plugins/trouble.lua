local M = {}

---@param c Colorscheme
---@param config Config
---@param hp Helper
function M.get(c, config, hp)
  return {
    TroubleText = { fg = c.base.white },
    TroubleCount = { fg = c.base.yellow, bold = true },
    TroubleNormal = { bg = c.base.surface0, fg = c.base.white },
    TroubleLocation = { fg = c.base.cyan },
    TroubleIndent = { fg = c.base.dimmed3 },
    TroubleSignError = { fg = c.base.red },
    TroubleSignWarning = { fg = c.base.orange },
    TroubleSignInformation = { fg = c.base.cyan },
    TroubleSignHint = { fg = c.base.green },
  }
end

return M
