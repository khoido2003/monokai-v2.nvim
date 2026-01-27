local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  return {
    GitConflictAncestor = { fg = c.base.yellow, bg = hp.blend(c.base.yellow, 0.1, c.editor.background) },
    GitConflictCurrent = { fg = c.base.green, bg = hp.blend(c.base.green, 0.1, c.editor.background) },
    GitConflictIncoming = { fg = c.base.blue, bg = hp.blend(c.base.blue, 0.1, c.editor.background) },
    GitConflictCommonAncestor = { fg = c.base.orange, bg = hp.blend(c.base.orange, 0.1, c.editor.background) },
    GitConflictSeparator = { fg = c.base.red, bold = true },
  }
end

return M
