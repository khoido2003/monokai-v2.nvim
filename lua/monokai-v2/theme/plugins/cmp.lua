local M = {}

--- @param c Colorscheme The color palette
--- @param hp Helper
function M.get(c, _, hp)
  return {
    CmpItemAbbrMatch = { fg = c.editorSuggestWidget.highlightForeground, bold = true }, -- text match in order
    CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" }, -- text match not in order
    CmpItemMenu = { fg = hp.lighten(c.editorSuggestWidget.foreground, -15) }, -- source of cmp. Ex: Lsp | Snippet
    CmpItemAbbr = { fg = c.editorSuggestWidget.foreground }, -- text that not match
    CmpItemAbbrDeprecated = { fg = c.editorSuggestWidget.foreground, strikethrough = true }, -- text not match of deprecated
    CmpItemKindArray = { fg = c.base.red },
    CmpItemKindBoolean = { fg = c.base.red },
    CmpItemKindClass = { fg = c.base.cyan },
    CmpItemKindColor = { fg = c.base.purple },
    CmpItemKindConstant = { fg = c.base.purple },
    CmpItemKindConstructor = { fg = c.base.green },
    CmpItemKindEnum = { fg = c.base.orange },
    CmpItemKindEnumMember = { fg = c.base.orange },
    CmpItemKindEvent = { fg = c.base.orange },
    CmpItemKindField = { fg = c.base.orange },
    CmpItemKindFile = { fg = c.editorLineNumber.activeForeground },
    CmpItemKindFolder = { fg = c.editorLineNumber.activeForeground },
    CmpItemKindFunction = { fg = c.base.green },
    CmpItemKindInterface = { fg = c.base.cyan },
    CmpItemKindKey = { fg = c.base.orange },
    CmpItemKindKeyword = { fg = c.base.red },
    CmpItemKindMethod = { fg = c.base.green },
    CmpItemKindModule = { fg = c.base.cyan },
    CmpItemKindNamespace = { fg = c.base.cyan },
    CmpItemKindNull = { fg = c.base.purple },
    CmpItemKindNumber = { fg = c.base.purple },
    CmpItemKindObject = { fg = c.base.cyan },
    CmpItemKindOperator = { fg = c.base.red },
    CmpItemKindPackage = { fg = c.base.purple },
    CmpItemKindProperty = { fg = c.base.orange },
    CmpItemKindReference = { fg = c.base.purple },
    CmpItemKindSnippet = { fg = c.base.green },
    CmpItemKindString = { fg = c.base.yellow },
    CmpItemKindStruct = { fg = c.base.red },
    CmpItemKindText = { fg = c.base.yellow },
    CmpItemKindTypeParameter = { fg = c.base.orange },
    CmpItemKindUnit = { fg = c.base.purple },
    CmpItemKindVariable = { fg = c.base.cyan },
  }
end

return M
