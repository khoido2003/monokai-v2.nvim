---@class monokai-v2.theme.plugins.mini
local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    MiniIndentscopeSymbol = { fg = c.base.orange },

    -- mini.status
    MiniStatuslineModeNormal = { fg = c.base.black, bg = c.base.green },
    MiniStatuslineModeInsert = { fg = c.base.black, bg = c.base.yellow },
    MiniStatuslineModeCommand = { fg = c.base.black, bg = c.base.orange },
    MiniStatuslineModeVisual = { fg = c.base.black, bg = c.base.purple },
    MiniStatuslineModeReplace = { fg = c.base.black, bg = c.base.red },
    MiniStatuslineModeOther = { fg = c.base.black, bg = c.base.white },
  }
end

return M
