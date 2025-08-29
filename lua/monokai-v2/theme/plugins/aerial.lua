local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    AerialLine = { bg = c.editor.selectionHighlightBackground },
    AerialArray = { fg = c.base.purple },
    AerialBoolean = { fg = c.base.purple },
    AerialClass = { fg = c.base.cyan },
    AerialConstant = { fg = c.base.purple },
    AerialConstructor = { fg = c.base.green },
    AerialEnum = { fg = c.base.cyan },
    AerialEnumMember = { fg = c.base.purple },
    AerialEvent = { fg = c.base.cyan },
    AerialField = { fg = c.base.white },
    AerialFile = { fg = c.base.green },
    AerialFunction = { fg = c.base.green },
    AerialInterface = { fg = c.base.green },
    AerialKey = { fg = c.base.purple },
    AerialMethod = { fg = c.base.green },
    AerialModule = { fg = c.base.cyan },
    AerialNamespace = { fg = c.base.white },
    AerialNull = { fg = c.base.red },
    AerialNumber = { fg = c.base.purple },
    AerialObject = { fg = c.base.purple },
    AerialOperator = { fg = c.base.red },
    AerialPackage = { fg = c.base.cyan },
    AerialProperty = { fg = c.base.cyan },
    AerialString = { fg = c.base.yellow },
    AerialStruct = { fg = c.base.cyan },
    AerialTypeParameter = { fg = c.base.red },
    AerialVariable = { fg = c.base.white },
  }
end

return M
