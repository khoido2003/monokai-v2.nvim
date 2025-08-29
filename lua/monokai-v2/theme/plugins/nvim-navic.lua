local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    NavicIconsArray = { fg = c.base.red },
    NavicIconsBoolean = { fg = c.base.red },
    NavicIconsClass = { fg = c.base.cyan },
    NavicIconsColor = { fg = c.base.purple },
    NavicIconsConstant = { fg = c.base.purple },
    NavicIconsConstructor = { fg = c.base.green },
    NavicIconsEnum = { fg = c.base.orange },
    NavicIconsEnumMember = { fg = c.base.orange },
    NavicIconsEvent = { fg = c.base.orange },
    NavicIconsField = { fg = c.base.orange },
    NavicIconsFile = { fg = c.editorLineNumber.activeForeground },
    NavicIconsFolder = { fg = c.editorLineNumber.activeForeground },
    NavicIconsFunction = { fg = c.base.green },
    NavicIconsInterface = { fg = c.base.cyan },
    NavicIconsKey = { fg = c.base.orange },
    NavicIconsKeyword = { fg = c.base.red },
    NavicIconsMethod = { fg = c.base.green },
    NavicIconsModule = { fg = c.base.cyan },
    NavicIconsNamespace = { fg = c.base.cyan },
    NavicIconsNull = { fg = c.base.purple },
    NavicIconsNumber = { fg = c.base.purple },
    NavicIconsObject = { fg = c.base.cyan },
    NavicIconsOperator = { fg = c.base.red },
    NavicIconsPackage = { fg = c.base.purple },
    NavicIconsProperty = { fg = c.base.orange },
    NavicIconsReference = { fg = c.base.purple },
    NavicIconsSnippet = { fg = c.base.green },
    NavicIconsString = { fg = c.base.yellow },
    NavicIconsStruct = { fg = c.base.red },
    NavicIconsText = { fg = c.base.yellow },
    NavicIconsTypeParameter = { fg = c.base.orange },
    NavicIconsUnit = { fg = c.base.purple },
    NavicIconsVariable = { fg = c.base.cyan },
  }
end

return M
