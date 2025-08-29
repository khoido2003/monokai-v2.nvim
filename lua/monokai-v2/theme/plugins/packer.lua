local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    packerString = { fg = c.base.orange },
    packerHash = { fg = c.base.orange },
    packerOutput = { fg = c.base.yellow },
    packerRelDate = { fg = c.base.purple },
    packerSuccess = { fg = c.base.green },
    packerStatusSuccess = { fg = c.base.green },
    packerStatusFail = { fg = c.base.red, bg = c.editorHoverWidget.background },
    packerFail = { fg = c.base.red, bg = c.editorHoverWidget.background },
  }
end

return M
