local M = {}

---@param c Colorscheme
---@param config Config
---@param hp Helper
function M.get(c, config, hp)
  local bg = hp.blend(c.base.black, 0.9, c.editor.background)
  return {
    ZenBg = { bg = bg },
    ZenFg = { fg = c.base.white },
    ZenBorder = { fg = c.base.dimmed3 },
  }
end

return M
