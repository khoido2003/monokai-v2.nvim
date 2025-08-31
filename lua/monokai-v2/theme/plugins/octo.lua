local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  return {
    OctoEditable = { bg = hp.blend(c.editor.selection, 0.2, c.editor.background) },
    OctoDirty = { fg = c.base.red },
    OctoIssue = { fg = c.base.cyan },
    OctoPull = { fg = c.base.green },
    OctoStateOpen = { fg = c.base.green, bold = true },
    OctoStateClosed = { fg = c.base.red, bold = true },
    OctoStateMerged = { fg = c.base.purple, bold = true },
  }
end

return M
