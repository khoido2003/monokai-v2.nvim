local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    AvanteTitle = { fg = c.base.yellow, bold = true },
    AvanteSubtitle = { fg = c.base.orange, bold = true },
    AvanteThirdTitle = { fg = c.base.green, bold = true },
    AvanteToastMsg = { fg = c.base.white },
    AvanteToastBorder = { fg = c.base.dimmed3 },
    AvantePopup = { bg = c.editor.background },
  }
end

return M
