local M = {}

---@param c Colorscheme
---@param config Config
---@param hp Helper
function M.get(c, config, hp)
  return {
    MatchParen = { bg = hp.blend(c.base.yellow, 0.2, c.editor.background), bold = true },
    MatchWord = { bg = hp.blend(c.base.green, 0.2, c.editor.background) },
    MatchWordCur = { bg = hp.blend(c.base.green, 0.3, c.editor.background), bold = true },
  }
end

return M
