local M = {}

---@param c Colorscheme
---@param config Config
---@param hp Helper
function M.get(c, config, hp)
  return {
    NeogitBranch = { fg = c.base.yellow, bold = true },
    NeogitRemote = { fg = c.base.cyan },
    NeogitHunkHeader = { fg = c.base.orange, bg = hp.blend(c.base.orange, 0.1, c.editor.background) },
    NeogitDiffAdd = { fg = c.base.green },
    NeogitDiffDelete = { fg = c.base.red },
    NeogitHunkHeaderHighlight = { fg = c.base.orange, bg = hp.blend(c.base.orange, 0.15, c.editor.background) },
    NeogitHunkHeaderSummary = { fg = c.base.white },
  }
end

return M
