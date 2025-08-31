local M = {}

---@param c Colorscheme
---@param config Config
---@param hp Helper
function M.get(c, config, hp)
  return {
    SymbolsOutlineConnector = { fg = c.base.dimmed3 },
    SymbolsOutlineCodeLens = { fg = c.base.dimmed4 },
    SymbolsOutlineContext = { fg = c.base.white, bold = true },
    SymbolsOutlineFile = { fg = c.base.cyan },
    SymbolsOutlineFunction = { fg = c.base.green },
    SymbolsOutlineVariable = { fg = c.base.orange },
    SymbolsOutlineClass = { fg = c.base.cyan },
    SymbolsOutlineMethod = { fg = c.base.green },
    SymbolsOutlineNamespace = { fg = c.base.cyan },
    SymbolsOutlineConstant = { fg = c.base.purple },
  }
end

return M
