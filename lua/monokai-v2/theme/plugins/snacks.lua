local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, hp)
  return {
    SnacksDashboardNormal = { bg = c.editor.background, fg = c.editor.foreground },
    SnacksDashboardDesc = { fg = c.base.dimmed1 },
    SnacksDashboardIcon = { fg = c.base.orange },
    SnacksPickerDir = { fg = c.base.dimmed1 },
    SnacksPickerFile = { fg = c.base.white },
    SnacksWinKeySep = { fg = c.base.dimmed1 },
    SnacksImageLoading = { fg = c.base.dimmed1 },
    SnacksPickerTotals = { fg = c.base.dimmed1 },
    SnacksPickerBufFlags = { fg = c.base.dimmed1 },
    SnacksPickerKeymapRhs = { fg = c.base.dimmed1 },
    SnacksPickerPathHidden = { fg = c.base.dimmed1 },
    SnacksPickerUnselected = { fg = c.base.dimmed1 },
    SnacksPickerPathIgnored = { fg = c.base.dimmed1 },
    SnacksPickerGitStatusIgnored = { fg = c.base.dimmed1 },
    SnacksPickerGitStatusUntracked = { fg = c.base.dimmed1 },
    SnacksPicker = { bg = c.editor.background, fg = c.editor.foreground },
    SnacksPickerBorder = { bg = c.editor.background, fg = c.tab.unfocusedActiveBorder },
    SnacksPickerTree = { fg = c.editorLineNumber.foreground },

    -- Notifier
    SnacksNotifierInfo = { fg = c.base.cyan },
    SnacksNotifierWarn = { fg = c.base.orange },
    SnacksNotifierDebug = { fg = c.base.dimmed1 },
    SnacksNotifierError = { fg = c.base.red },
    SnacksNotifierTrace = { fg = c.base.dimmed1 },
    SnacksNotifierIconInfo = { fg = c.base.cyan },
    SnacksNotifierIconWarn = { fg = c.base.orange },
    SnacksNotifierIconDebug = { fg = c.base.dimmed1 },
    SnacksNotifierIconError = { fg = c.base.red },
    SnacksNotifierIconTrace = { fg = c.base.dimmed1 },
    SnacksNotifierBorderInfo = { fg = c.base.cyan },
    SnacksNotifierBorderWarn = { fg = c.base.orange },
    SnacksNotifierBorderDebug = { fg = c.base.dimmed1 },
    SnacksNotifierBorderError = { fg = c.base.red },
    SnacksNotifierBorderTrace = { fg = c.base.dimmed1 },
    SnacksNotifierTitleInfo = { fg = c.base.cyan },
    SnacksNotifierTitleWarn = { fg = c.base.orange },
    SnacksNotifierTitleDebug = { fg = c.base.dimmed1 },
    SnacksNotifierTitleError = { fg = c.base.red },
    SnacksNotifierTitleTrace = { fg = c.base.dimmed1 },

    -- Input
    SnacksInputNormal = { bg = c.editor.background, fg = c.editor.foreground },
    SnacksInputBorder = { fg = c.tab.unfocusedActiveBorder },
    SnacksInputTitle = { fg = c.base.orange },

    -- Scratch
    SnacksScratchNormal = { bg = c.editor.background, fg = c.editor.foreground },
    SnacksScratchDesc = { fg = c.base.dimmed1 },
    SnacksScratchIcon = { fg = c.base.purple },
  }
end

return M
