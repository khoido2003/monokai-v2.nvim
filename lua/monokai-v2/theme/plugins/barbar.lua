local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, hp)
  return {
    -- Current
    BufferCurrent = { bg = c.editor.background, fg = c.base.white, bold = true },
    BufferCurrentIndex = { bg = c.editor.background, fg = c.base.cyan },
    BufferCurrentMod = { bg = c.editor.background, fg = c.base.yellow },
    BufferCurrentSign = { bg = c.editor.background, fg = c.base.cyan },
    BufferCurrentTarget = { bg = c.editor.background, fg = c.base.red, bold = true },

    -- Visible
    BufferVisible = { bg = c.editor.background, fg = c.base.dimmed1 },
    BufferVisibleIndex = { bg = c.editor.background, fg = c.base.dimmed1 },
    BufferVisibleMod = { bg = c.editor.background, fg = c.base.yellow },
    BufferVisibleSign = { bg = c.editor.background, fg = c.base.dimmed1 },
    BufferVisibleTarget = { bg = c.editor.background, fg = c.base.red, bold = true },

    -- Inactive
    BufferInactive = { bg = c.sideBar.background, fg = c.base.dimmed3 },
    BufferInactiveIndex = { bg = c.sideBar.background, fg = c.base.dimmed4 },
    BufferInactiveMod = { bg = c.sideBar.background, fg = c.base.dimmed2 },
    BufferInactiveSign = { bg = c.sideBar.background, fg = c.base.dimmed4 },
    BufferInactiveTarget = { bg = c.sideBar.background, fg = c.base.red, bold = true },

    -- Tabpages
    BufferTabpages = { bg = c.editorGroupHeader.tabsBackground, fg = c.base.white, bold = true },
    BufferTabpageFill = { bg = c.editorGroupHeader.tabsBackground, fg = c.base.dimmed4 },

    -- Pick/Offset
    BufferOffset = { bg = c.sideBar.background, fg = c.base.dimmed3 },
  }
end

return M
