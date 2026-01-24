local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  local isBackgroundClear = config.background_clear and vim.tbl_contains(config.background_clear, "float_win") or false
  local transparent_bg = c.base.black

  return {
    LspSignatureActiveParameter = {
      fg = c.base.orange,
      bold = true,
      underline = true,
    },
    LspSignatureHint = {
      fg = c.base.dimmed1,
    },
  }
end

return M
