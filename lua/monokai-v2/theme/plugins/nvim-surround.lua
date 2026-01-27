local M = {}

---@param c Colorscheme
---@param config Config
---@param hp Helper
function M.get(c, config, hp)
  return {
    NvimSurroundDelimiter = { fg = c.base.yellow },
    NvimSurroundHighlight = { bg = hp.blend(c.base.yellow, 0.15, c.editor.background) },
    NvimSurroundDelete = { fg = c.base.red },
  }
end

return M
