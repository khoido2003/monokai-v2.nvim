local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  return {
    -- Outline Window Highlighting
    OutlineCurrent = { fg = c.base.yellow, bg = c.list.activeSelectionBackground, bold = true },
    OutlineGuides = { fg = c.base.dimmed1 },
    OutlineFoldMarker = { fg = c.base.cyan },
    OutlineDetails = { fg = c.base.dimmed2 },
    OutlineLineno = { fg = c.base.dimmed4 },
    OutlineJumpHighlight = { bg = c.editor.selectionBackground },

    -- Help & Status Window Highlighting
    OutlineHelpTip = { fg = c.base.dimmed2 },
    OutlineStatusFt = { fg = c.base.cyan },
    OutlineStatusError = { fg = c.base.red },
    OutlineStatusProvider = { fg = c.base.purple },
    OutlineKeymapHelpKey = { fg = c.base.purple },
    OutlineKeymapHelpDisabled = { fg = c.base.dimmed2 },

    -- Symbol Kinds
    OutlineSymbol = { fg = c.base.purple },

    OutlineFile = { fg = c.base.cyan },
    OutlineModule = { fg = c.base.cyan },
    OutlineNamespace = { fg = c.base.cyan },
    OutlinePackage = { fg = c.base.cyan },
    OutlineClass = { fg = c.base.cyan },
    OutlineMethod = { fg = c.base.green },
    OutlineProperty = { fg = c.base.white },
    OutlineField = { fg = c.base.white },
    OutlineConstructor = { fg = c.base.cyan },
    OutlineEnum = { fg = c.base.cyan },
    OutlineInterface = { fg = c.base.cyan },
    OutlineFunction = { fg = c.base.green },
    OutlineVariable = { fg = c.base.white },
    OutlineConstant = { fg = c.base.purple },
    OutlineString = { fg = c.base.yellow },
    OutlineNumber = { fg = c.base.purple },
    OutlineBoolean = { fg = c.base.purple },
    OutlineArray = { fg = c.base.orange },
    OutlineObject = { fg = c.base.purple },
    OutlineKey = { fg = c.base.yellow },
    OutlineNull = { fg = c.base.purple },
    OutlineEnumMember = { fg = c.base.purple },
    OutlineStruct = { fg = c.base.cyan },
    OutlineEvent = { fg = c.base.purple },
    OutlineOperator = { fg = c.base.red },
    OutlineTypeParameter = { fg = c.base.cyan },
    OutlineComponent = { fg = c.base.cyan },
    OutlineFragment = { fg = c.base.cyan },
  }
end

return M
