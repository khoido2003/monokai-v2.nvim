local M = {}

---@param c Colorscheme
---@param config Config
---@param hp Helper
function M.get(c, config, hp)
  return {
    SymbolsOutlineConnector = { fg = c.base.dimmed3 },
    SymbolsOutlineCodeLens = { fg = c.base.dimmed3 },
    SymbolsOutlineContext = { fg = c.base.white, bold = true },

    SymbolsOutlineFile = { fg = c.base.cyan },
    SymbolsOutlineModule = { fg = c.base.cyan },
    SymbolsOutlineNamespace = { fg = c.base.cyan },
    SymbolsOutlinePackage = { fg = c.base.cyan },
    SymbolsOutlineClass = { fg = c.base.cyan },
    SymbolsOutlineMethod = { fg = c.base.green },
    SymbolsOutlineProperty = { fg = c.base.white },
    SymbolsOutlineField = { fg = c.base.white },
    SymbolsOutlineConstructor = { fg = c.base.cyan },
    SymbolsOutlineEnum = { fg = c.base.cyan },
    SymbolsOutlineInterface = { fg = c.base.cyan },
    SymbolsOutlineFunction = { fg = c.base.green },
    SymbolsOutlineVariable = { fg = c.base.white },
    SymbolsOutlineConstant = { fg = c.base.purple },
    SymbolsOutlineString = { fg = c.base.yellow },
    SymbolsOutlineNumber = { fg = c.base.purple },
    SymbolsOutlineBoolean = { fg = c.base.purple },
    SymbolsOutlineArray = { fg = c.base.orange },
    SymbolsOutlineObject = { fg = c.base.purple },
    SymbolsOutlineKey = { fg = c.base.yellow },
    SymbolsOutlineNull = { fg = c.base.purple },
    SymbolsOutlineEnumMember = { fg = c.base.purple },
    SymbolsOutlineStruct = { fg = c.base.cyan },
    SymbolsOutlineEvent = { fg = c.base.purple },
    SymbolsOutlineOperator = { fg = c.base.red },
    SymbolsOutlineTypeParameter = { fg = c.base.cyan },
  }
end

return M
