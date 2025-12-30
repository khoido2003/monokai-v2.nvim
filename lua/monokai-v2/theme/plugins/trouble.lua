local M = {}

---@param c Colorscheme
---@param config Config
---@param hp Helper
function M.get(c, config, hp)
  return {
    TroubleNormal = { bg = c.base.surface0, fg = c.base.white },
    TroubleNormalNC = { link = "TroubleNormal" },
    TroublePreview = { bg = c.base.dimmed5 },

    -- Items
    TroubleFilename = { fg = c.base.white, bold = true },
    TroubleDirectory = { fg = c.base.cyan },
    TroubleWinKind = { fg = c.base.purple, bold = true },
    TroubleCount = { fg = c.base.yellow, bold = true },
    TroubleIconDirectory = { fg = c.base.cyan },
    TroubleIconFile = { fg = c.base.white },

    -- Status
    TroubleError = { fg = c.base.red },
    TroubleWarning = { fg = c.base.orange },
    TroubleInfo = { fg = c.base.cyan },
    TroubleHint = { fg = c.base.green },

    -- Signs (Legacy v2 mostly, but good to keep links)
    TroubleSignError = { link = "TroubleError" },
    TroubleSignWarning = { link = "TroubleWarning" },
    TroubleSignInformation = { link = "TroubleInfo" },
    TroubleSignHint = { link = "TroubleHint" },

    -- UI
    TroubleIndent = { fg = c.base.dimmed3 },
    TroubleSource = { fg = c.base.dimmed3 },
    TroubleFoldIcon = { fg = c.base.dimmed3 },
  }
end

return M
