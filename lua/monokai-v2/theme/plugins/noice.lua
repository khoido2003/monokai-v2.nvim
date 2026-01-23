local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    NoiceCmdlinePopup = { bg = c.editor.background },
    NoiceCmdlinePopupBorder = {
      bg = c.editor.background,
      fg = c.editorSuggestWidget.foreground,
    },
    NoiceCmdlinePopupBorderSearch = {
      bg = c.editor.background,
      fg = c.base.orange,
    },
    NoiceCmdlineIconSearch = { fg = c.base.orange },
    NoiceFormatProgressDone = { bg = c.base.yellow, fg = c.base.black, bold = true },
    NoiceFormatProgressTodo = { bg = c.base.dimmed3, fg = c.base.white },
    NoiceLspProgressTitle = { fg = c.base.dimmed2 },
    NoiceLspProgressClient = { fg = c.base.cyan },
    NoiceConfirm = { bg = c.notifications.background, fg = c.notifications.foreground },
    NoiceConfirmBorder = { bg = c.notifications.background, fg = c.notifications.border },
    NoiceFormatConfirm = { bg = c.button.background, fg = c.button.foreground },
    NoiceFormatConfirmDefault = { bg = c.button.hoverBackground, fg = c.button.foreground },
    NoiceSplit = { bg = c.editor.background },
    NoiceMini = { fg = c.base.dimmed2 },
  }
end

return M
