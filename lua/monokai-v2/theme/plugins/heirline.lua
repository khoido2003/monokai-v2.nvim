local M = {}

--- Minimal defaults for heirline.nvim.
--- Heirline components can define their own hl, but these groups are commonly
--- referenced as global fallbacks in user configs.
---
--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    HeirlineNormal = { link = "StatusLine" },
    HeirlineNormalNC = { link = "StatusLineNC" },
    HeirlineWinBar = { link = "WinBar" },
    HeirlineWinBarNC = { link = "WinBarNC" },
    HeirlineFill = { fg = c.editor.foreground, bg = c.editor.background },
  }
end

return M
