local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  local transparent_bg = c.base.black
  local transparent_bg_border = c.base.dimmed2

  local common_fg = hp.lighten(c.sideBar.foreground, 30)
  local title_bg = config.filter == "light" and c.base.red or c.base.yellow

  return {
    -- Main window
    FzfLuaNormal = { bg = transparent_bg, fg = common_fg },
    FzfLuaBorder = { bg = transparent_bg, fg = transparent_bg_border },
    FzfLuaTitle = { bg = title_bg, fg = c.base.black, bold = true },
    FzfLuaBackdrop = { bg = c.base.dark },

    -- Preview window
    FzfLuaPreviewNormal = { bg = transparent_bg, fg = common_fg },
    FzfLuaPreviewBorder = { bg = transparent_bg, fg = transparent_bg_border },
    FzfLuaPreviewTitle = { bg = title_bg, fg = c.base.black, bold = true },

    -- Selection and cursor
    FzfLuaCursor = { link = "Cursor" },
    FzfLuaCursorLine = {
      bg = hp.blend(c.editorSuggestWidget.selectedBackground, 0.3, transparent_bg),
      fg = c.base.white,
      bold = true,
    },
    FzfLuaCursorLineNr = { fg = c.base.yellow, bold = true },

    -- Scrollbar
    FzfLuaScrollBorderEmpty = { fg = transparent_bg_border },
    FzfLuaScrollBorderFull = { fg = c.base.dimmed3 },
    FzfLuaScrollFloatEmpty = { bg = transparent_bg },
    FzfLuaScrollFloatFull = { bg = c.base.dimmed3 },

    -- Help window
    FzfLuaHelpNormal = { bg = transparent_bg, fg = common_fg },
    FzfLuaHelpBorder = { bg = transparent_bg, fg = transparent_bg_border },

    -- Header
    FzfLuaHeaderBind = { fg = c.base.cyan, bold = true },
    FzfLuaHeaderText = { fg = c.base.green },

    -- Path styling
    FzfLuaPathColNr = { fg = c.base.dimmed1 },
    FzfLuaPathLineNr = { fg = c.base.dimmed1 },
    FzfLuaDirIcon = { fg = c.base.yellow },
    FzfLuaDirPart = { fg = c.base.dimmed1 },
    FzfLuaFilePart = { fg = c.base.white },

    -- Fzf specific elements
    FzfLuaFzfNormal = { fg = common_fg },
    FzfLuaFzfCursorLine = {
      bg = hp.blend(c.editorSuggestWidget.selectedBackground, 0.3, transparent_bg),
      fg = c.base.white,
    },
    FzfLuaFzfMatch = { fg = c.base.yellow, bold = true },
    FzfLuaFzfHl = { fg = c.base.yellow, bold = true },
    FzfLuaFzfHlPlus = { fg = c.base.yellow, bold = true },
    FzfLuaFzfBorder = { fg = transparent_bg_border },
    FzfLuaFzfScrollbar = { fg = c.base.dimmed3 },
    FzfLuaFzfSeparator = { fg = transparent_bg_border },
    FzfLuaFzfGutter = { bg = transparent_bg },
    FzfLuaFzfHeader = { fg = c.base.dimmed1 },
    FzfLuaFzfInfo = { fg = c.base.white, bold = true },
    FzfLuaFzfPointer = { fg = c.base.green },
    FzfLuaFzfMarker = { fg = c.base.magenta },
    FzfLuaFzfSpinner = { fg = c.base.cyan },
    FzfLuaFzfPrompt = { fg = c.base.white },
    FzfLuaFzfQuery = { fg = common_fg },

    -- Live grep / search
    FzfLuaLivePrompt = { fg = c.base.white, bold = true },

    -- Buf/Tab styling
    FzfLuaBufName = { fg = c.base.yellow },
    FzfLuaBufNr = { fg = c.base.dimmed1 },
    FzfLuaBufLineNr = { fg = c.base.dimmed1 },
    FzfLuaBufFlagCur = { fg = c.base.yellow },
    FzfLuaBufFlagAlt = { fg = c.base.magenta },
    FzfLuaTabTitle = { fg = c.base.cyan, bold = true },
    FzfLuaTabMarker = { fg = c.base.yellow },
  }
end

return M
