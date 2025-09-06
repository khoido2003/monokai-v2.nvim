local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  local float_winBackgroundClear = vim.tbl_contains(config.background_clear, "float_win")
  return {
    BlinkCmpMenu = { bg = c.editorSuggestWidget.background, fg = hp.lighten(c.editorSuggestWidget.foreground, -15) },

    BlinkCmpMenuSelection = float_winBackgroundClear
        and {
          bg = hp.blend(c.editorSuggestWidget.selectedBackground, 0.5),
          fg = config.filter == "light" and hp.lighten(c.base.red, -15) or hp.lighten(c.base.yellow, -15),
          bold = true,
        }
      or {
        fg = config.filter == "light" and hp.lighten(c.base.red, -10) or hp.lighten(c.base.yellow, -10),
        bg = config.filter == "light" and hp.blend(c.editorSuggestWidget.selectedBackground, 0.45, c.editor.background)
          or hp.blend(c.editorSuggestWidget.selectedBackground, 0.55, c.editor.background),
        bold = true,
      },

    BlinkCmpLabelDescription = { fg = hp.lighten(c.base.dimmed1, 3) },
    BlinkCmpLabelDeprecated = { fg = nil, bg = nil, strikethrough = true },
    BlinkCmpGhostText = { link = "Comment" },
    BlinkCmpLabel = { fg = hp.lighten(c.editorSuggestWidget.foreground, -15) },
    BlinkCmpLabelMatch = { fg = c.base.white, bold = true },
    BlinkCmpSource = { fg = c.editorSuggestWidget.foreground },
    BlinkCmpKind = { fg = hp.lighten(c.editorSuggestWidget.foreground, -15) },
    BlinkCmpKindArray = { fg = c.base.red },
    BlinkCmpKindBoolean = { fg = c.base.red },
    BlinkCmpKindClass = { fg = c.base.cyan },
    BlinkCmpKindColor = { fg = c.base.purple },
    BlinkCmpKindConstant = { fg = c.base.purple },
    BlinkCmpKindConstructor = { fg = c.base.green },
    BlinkCmpKindEnum = { fg = c.base.orange },
    BlinkCmpKindEnumMember = { fg = c.base.orange },
    BlinkCmpKindEvent = { fg = c.base.orange },
    BlinkCmpKindField = { fg = c.base.orange },
    BlinkCmpKindFile = { fg = c.editorLineNumber.activeForeground },
    BlinkCmpKindFolder = { fg = c.editorLineNumber.activeForeground },
    BlinkCmpKindFunction = { fg = c.base.green },
    BlinkCmpKindInterface = { fg = c.base.cyan },
    BlinkCmpKindKey = { fg = c.base.orange },
    BlinkCmpKindKeyword = { fg = c.base.red },
    BlinkCmpKindMethod = { fg = c.base.green },
    BlinkCmpKindModule = { fg = c.base.cyan },
    BlinkCmpKindNamespace = { fg = c.base.cyan },
    BlinkCmpKindNull = { fg = c.base.purple },
    BlinkCmpKindNumber = { fg = c.base.purple },
    BlinkCmpKindObject = { fg = c.base.cyan },
    BlinkCmpKindOperator = { fg = c.base.red },
    BlinkCmpKindPackage = { fg = c.base.purple },
    BlinkCmpKindProperty = { fg = c.base.orange },
    BlinkCmpKindReference = { fg = c.base.purple },
    BlinkCmpKindSnippet = { fg = c.base.green },
    BlinkCmpKindString = { fg = c.base.yellow },
    BlinkCmpKindStruct = { fg = c.base.red },
    BlinkCmpKindText = { fg = c.base.yellow },
    BlinkCmpKindTypeParameter = { fg = c.base.orange },
    BlinkCmpKindUnit = { fg = c.base.purple },
    BlinkCmpKindVariable = { fg = c.base.cyan },
  }
end

return M
