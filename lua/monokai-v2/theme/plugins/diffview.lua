local M = {}

---@param c Colorscheme
---@param config Config
---@param helper Helper
M.get = function(c, config, helper)
  return {
    DiffviewFilePanelTitle = { fg = c.base.magenta, bold = true },
    DiffviewFilePanelCounter = { fg = c.base.blue },
    DiffviewFilePanelFileName = { fg = c.editor.foreground },

    DiffviewNormal = { fg = c.editor.foreground, bg = c.editor.background },
    DiffviewCursorLine = { bg = helper.lighten(c.editor.selection, 5) },
  }
end

return M
