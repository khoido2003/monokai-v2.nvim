local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  return {
    LazyGitBorder = { fg = c.base.dimmed2, bg = c.editor.background },
    LazyGitNormal = { fg = c.editor.foreground, bg = c.editor.background },
    LazyGitTitle = { fg = c.base.cyan, bold = true },
    LazyGitSelection = { fg = c.base.yellow, bg = hp.blend(c.base.yellow, 0.15, c.editor.background) },
  }
end

return M
