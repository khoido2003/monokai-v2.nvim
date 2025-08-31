local M = {}

---@param c Colorscheme
---@param config Config
---@param hp Helper
function M.get(c, config, hp)
  local bg = c.editor.background
  return {
    LspSagaBorderTitle = { fg = c.base.yellow, bold = true },
    LspSagaBorder = { fg = c.base.dimmed3 },
    LspSagaFinderSelection = { fg = c.base.green, bold = true },
    LspSagaCodeActionTitle = { fg = c.base.cyan, bold = true },
    LspSagaHoverBorder = { fg = c.base.dimmed3 },
    LspSagaRenameBorder = { fg = c.base.yellow },
    LspSagaDefPreviewBorder = { fg = c.base.dimmed3 },
    LspSagaDiagnosticBorder = { fg = c.base.red },
    LspSagaShTrunKeyword = { fg = c.base.orange, italic = true },
  }
end

return M
