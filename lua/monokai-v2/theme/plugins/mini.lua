---@class monokai-v2.theme.plugins.mini
local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    MiniIndentscopeSymbol = { fg = c.base.orange },

    -- mini.status
    MiniStatuslineModeNormal = { fg = c.base.black, bg = c.base.green },
    MiniStatuslineModeInsert = { fg = c.base.black, bg = c.base.yellow },
    MiniStatuslineModeCommand = { fg = c.base.black, bg = c.base.orange },
    MiniStatuslineModeVisual = { fg = c.base.black, bg = c.base.purple },
    MiniStatuslineModeReplace = { fg = c.base.black, bg = c.base.red },
    MiniStatuslineModeOther = { fg = c.base.black, bg = c.base.white },
    
    -- mini.files
    MiniFilesFile = { fg = c.base.white },
    MiniFilesDirectory = { fg = c.base.cyan },
    MiniFilesTitle = { fg = c.base.orange, bold = true },
    MiniFilesBorder = { fg = c.tab.unfocusedActiveBorder },
    MiniFilesCursorLine = { bg = c.editorSuggestWidget.selectedBackground },

    -- mini.pick
    MiniPickMatchCurrent = { bg = c.base.dimmed4, fg = c.base.yellow, bold = true },
    MiniPickMatchMarked = { bg = c.base.dimmed4, fg = c.base.green, bold = true },
    MiniPickMatchRanges = { fg = c.base.cyan, bold = true },
    MiniPickNormal = { bg = c.editor.background, fg = c.editor.foreground },
    MiniPickBorder = { fg = c.tab.unfocusedActiveBorder },
    MiniPickPrompt = { fg = c.base.orange, bold = true },
    MiniPickHeader = { fg = c.base.purple, bold = true },

    -- mini.clue
    MiniClueBorder = { fg = c.tab.unfocusedActiveBorder },
    MiniClueDescGroup = { fg = c.base.orange },
    MiniClueDescSingle = { fg = c.base.white },
    MiniClueNextKey = { fg = c.base.cyan, bold = true },
    MiniClueSeparator = { fg = c.base.dimmed3 },
    MiniClueTitle = { fg = c.base.green, bold = true },

    -- mini.hipatterns
    MiniHipatternsFixme = { fg = c.base.black, bg = c.base.red, bold = true },
    MiniHipatternsHack = { fg = c.base.black, bg = c.base.yellow, bold = true },
    MiniHipatternsNote = { fg = c.base.black, bg = c.base.cyan, bold = true },
    MiniHipatternsTodo = { fg = c.base.black, bg = c.base.purple, bold = true },

    -- mini.starter
    MiniStarterCurrent = { fg = c.base.yellow, bold = true },
    MiniStarterFooter = { fg = c.base.dimmed2 },
    MiniStarterHeader = { fg = c.base.orange },
    MiniStarterInactive = { fg = c.base.dimmed3 },
    MiniStarterItem = { fg = c.base.white },
    MiniStarterItemBullet = { fg = c.base.dimmed4 },
    MiniStarterItemPrefix = { fg = c.base.cyan },
    MiniStarterSection = { fg = c.base.purple },
    MiniStarterQuery = { fg = c.base.green },

    -- mini.surround
    MiniSurround = { bg = c.base.dimmed2 },
    
    -- mini.cursorword
    MiniCursorword = { bg = c.base.dimmed5 },
    MiniCursorwordCurrent = { bg = c.base.dimmed5 },
  }
end

return M
