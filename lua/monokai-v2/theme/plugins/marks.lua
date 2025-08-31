local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  return {
    MarkSignHL = { fg = c.base.yellow, bold = true },
    MarkVirtTextHL = { fg = c.base.purple },
  }
end

return M
