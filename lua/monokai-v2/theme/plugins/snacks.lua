local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  local bg_clear = config.background_clear or {}
  local isPickerBackgroundClear = vim.tbl_contains(bg_clear, "snacks") or vim.tbl_contains(bg_clear, "telescope")
  local isExplorerBackgroundClear = vim.tbl_contains(bg_clear, "snacks")
    or vim.tbl_contains(bg_clear, "nvim-tree")
    or vim.tbl_contains(bg_clear, "neo-tree")

  local transparent_bg = c.base.black
  local transparent_bg_border = c.base.dimmed2

  -- Darker backgrounds
  local preview_bg = c.base.dimmed5
  local prompt_bg = hp.lighten(c.base.dimmed5, 10)
  local result_bg = c.base.dimmed5
  local picker_fg = hp.lighten(c.sideBar.foreground, 30)

  -- Picker selection background
  local picker_selection_bg = isPickerBackgroundClear
      and hp.blend(c.editorSuggestWidget.selectedBackground, 0.3, transparent_bg)
    or hp.blend(c.base.green, 0.2, result_bg)

  local sidebar_bg = isExplorerBackgroundClear and c.editor.background or c.sideBar.background
  local explorer_selection_bg = c.list.activeSelectionBackground

  -- Common picker backgrounds based on transparency setting
  local picker_bg = isPickerBackgroundClear and transparent_bg or result_bg
  local picker_border_bg = transparent_bg
  local picker_border_fg = isPickerBackgroundClear and transparent_bg_border or result_bg

  return {
    -- ══════════════════════════════════════════════════════════════════════
    -- Base / Global
    -- ══════════════════════════════════════════════════════════════════════
    SnacksNormal = { bg = c.editor.background, fg = c.editor.foreground },
    SnacksNormalNC = { link = "SnacksNormal" },
    SnacksBorder = { fg = c.tab.unfocusedActiveBorder },
    SnacksFooter = { fg = c.base.dimmed2 },
    SnacksBackdrop = { bg = c.base.dark },
    SnacksWinBar = { link = "SnacksNormal" },
    SnacksWinBarNC = { bg = c.editor.background, fg = c.base.dimmed2 },
    SnacksWinKey = { fg = c.base.yellow, bold = true },
    SnacksWinKeySep = { fg = c.base.dimmed1 },

    -- ══════════════════════════════════════════════════════════════════════
    -- Picker - Windows
    -- ══════════════════════════════════════════════════════════════════════
    SnacksPicker = { bg = picker_bg, fg = picker_fg },
    SnacksPickerBorder = isPickerBackgroundClear and { bg = transparent_bg, fg = c.tab.unfocusedActiveBorder }
      or { bg = c.editor.background, fg = c.editorHoverWidget.background },
    SnacksPickerTitle = {
      bg = config.filter == "light" and c.base.red or c.base.yellow,
      fg = c.base.black,
      bold = true,
    },

    -- Prompt
    SnacksPickerPrompt = { fg = c.base.yellow },
    SnacksPickerPromptNormal = { bg = isPickerBackgroundClear and transparent_bg or prompt_bg, fg = picker_fg },
    SnacksPickerPromptBorder = {
      bg = picker_border_bg,
      fg = isPickerBackgroundClear and transparent_bg_border or prompt_bg,
    },
    SnacksPickerPromptTitle = { link = "SnacksPickerTitle" },
    SnacksPickerPromptPrefix = { fg = c.base.white },

    -- Input
    SnacksPickerInput = { link = "SnacksPickerPromptNormal" },
    SnacksPickerInputBorder = { link = "SnacksPickerPromptBorder" },
    SnacksPickerInputTitle = { link = "SnacksPickerTitle" },

    -- Preview
    SnacksPickerPreview = { bg = isPickerBackgroundClear and transparent_bg or preview_bg, fg = picker_fg },
    SnacksPickerPreviewNormal = { link = "SnacksPickerPreview" },
    SnacksPickerPreviewBorder = {
      bg = picker_border_bg,
      fg = isPickerBackgroundClear and transparent_bg_border or preview_bg,
    },
    SnacksPickerPreviewTitle = { link = "SnacksPickerTitle" },
    SnacksPickerPreviewLine = { bg = picker_selection_bg, bold = true },

    -- List / Results
    SnacksPickerList = { bg = picker_bg, fg = picker_fg },
    SnacksPickerListNormal = { link = "SnacksPickerList" },
    SnacksPickerListBorder = { bg = picker_border_bg, fg = picker_border_fg },
    SnacksPickerListTitle = { link = "SnacksPickerTitle" },
    SnacksPickerListCursorLine = { bg = picker_selection_bg, bold = true },

    -- Selection & Cursor
    SnacksPickerSelection = { bg = picker_selection_bg, bold = true },
    SnacksPickerSelectionCaret = { bg = picker_selection_bg, fg = c.base.green, bold = true },
    SnacksPickerCursorLine = { bg = picker_selection_bg },
    SnacksPickerCursorLineNr = { bg = picker_selection_bg, fg = c.editorLineNumber.activeForeground, bold = true },

    -- Line numbers / columns (inherit bg from picker)
    SnacksPickerLineNr = { bg = picker_bg, fg = c.editorLineNumber.foreground },
    SnacksPickerSignColumn = { bg = picker_bg, fg = c.editorLineNumber.foreground },
    SnacksPickerFoldColumn = { bg = picker_bg, fg = c.editorLineNumber.foreground },
    SnacksPickerEndOfBuffer = { fg = picker_bg },

    -- ══════════════════════════════════════════════════════════════════════
    -- Picker - Content styling
    -- ══════════════════════════════════════════════════════════════════════
    SnacksPickerMatch = { fg = config.filter == "light" and c.base.red or c.base.yellow, bold = true },
    SnacksPickerSearch = { link = "Search" },
    SnacksPickerFile = { fg = c.base.white },
    SnacksPickerDir = { fg = c.base.dimmed1 },
    SnacksPickerDirectory = { fg = c.sideBar.foreground },
    SnacksPickerLink = { fg = c.base.cyan, italic = true },
    SnacksPickerLinkBroken = { fg = c.base.red, italic = true },
    SnacksPickerRow = { fg = c.base.green },
    SnacksPickerCol = { fg = c.editorLineNumber.foreground },
    SnacksPickerTree = { fg = c.editorLineNumber.foreground },

    -- UI elements
    SnacksPickerTotals = { fg = c.base.dimmed1 },
    SnacksPickerPromptCounter = { fg = c.base.white, bold = true },
    SnacksPickerSpinner = { fg = c.base.yellow },
    SnacksPickerToggle = { fg = c.base.cyan, bg = hp.blend(c.base.cyan, 0.1, c.editor.background) },
    SnacksPickerDimmed = { fg = c.base.dimmed2 },
    SnacksPickerSelected = { fg = c.base.yellow },
    SnacksPickerUnselected = { fg = c.base.dimmed1 },
    SnacksPickerIdx = { fg = c.base.yellow },
    SnacksPickerBold = { bold = true },
    SnacksPickerItalic = { italic = true },
    SnacksPickerCode = { bg = c.base.dimmed5, fg = c.base.orange },
    SnacksPickerSpecial = { fg = c.base.purple },
    SnacksPickerLabel = { fg = c.base.purple },
    SnacksPickerDelim = { fg = c.base.dimmed2 },
    SnacksPickerComment = { fg = c.base.dimmed2, italic = true },
    SnacksPickerDesc = { fg = c.base.dimmed2 },
    SnacksPickerCmd = { fg = c.base.green },
    SnacksPickerCmdBuiltin = { fg = c.base.cyan },
    SnacksPickerRule = { fg = c.base.dimmed3 },

    -- Buffers
    SnacksPickerBufNr = { fg = c.base.yellow },
    SnacksPickerBufFlags = { fg = c.base.dimmed1 },
    SnacksPickerBufType = { fg = c.base.green },
    SnacksPickerFileType = { fg = c.base.cyan },
    SnacksPickerTime = { fg = c.base.purple },

    -- Autocmds
    SnacksPickerAuPattern = { fg = c.base.green },
    SnacksPickerAuEvent = { fg = c.base.purple },
    SnacksPickerAuGroup = { fg = c.base.cyan },

    -- Diagnostics
    SnacksPickerDiagnosticCode = { fg = c.base.purple },
    SnacksPickerDiagnosticSource = { fg = c.base.dimmed2, italic = true },

    -- Keymaps
    SnacksPickerRegister = { fg = c.base.yellow },
    SnacksPickerKeymap = { fg = c.base.white },
    SnacksPickerKeymapMode = { fg = c.base.yellow },
    SnacksPickerKeymapLhs = { fg = c.base.purple },
    SnacksPickerKeymapRhs = { fg = c.base.dimmed1 },
    SnacksPickerKeymapNowait = { fg = c.base.orange },

    -- Undo
    SnacksPickerUndoAdded = { fg = c.gitDecoration.addedResourceForeground },
    SnacksPickerUndoRemoved = { fg = c.gitDecoration.deletedResourceForeground },
    SnacksPickerUndoCurrent = { fg = c.base.orange },
    SnacksPickerUndoSaved = { fg = c.base.purple },

    -- Git
    SnacksPickerGitCommit = { fg = c.base.orange },
    SnacksPickerGitBreaking = { fg = c.base.red, bold = true },
    SnacksPickerGitDetached = { fg = c.base.orange },
    SnacksPickerGitBranch = { fg = c.base.purple, bold = true },
    SnacksPickerGitBranchCurrent = { fg = c.base.yellow },
    SnacksPickerGitDate = { fg = c.base.purple },
    SnacksPickerGitIssue = { fg = c.base.yellow },
    SnacksPickerGitAuthor = { fg = c.base.purple },
    SnacksPickerGitType = { fg = c.base.cyan, bold = true },
    SnacksPickerGitScope = { fg = c.base.dimmed1, italic = true },
    SnacksPickerGitStatus = { fg = c.base.purple },
    SnacksPickerGitStatusAdded = { fg = c.gitDecoration.addedResourceForeground },
    SnacksPickerGitStatusModified = { fg = c.gitDecoration.modifiedResourceForeground },
    SnacksPickerGitStatusDeleted = { fg = c.gitDecoration.deletedResourceForeground },
    SnacksPickerGitStatusRenamed = { fg = c.gitDecoration.untrackedResourceForeground },
    SnacksPickerGitStatusUntracked = { fg = c.base.green, bold = true },
    SnacksPickerGitStatusCopied = { fg = c.base.purple },
    SnacksPickerGitStatusIgnored = { fg = c.gitDecoration.ignoredResourceForeground },
    SnacksPickerGitStatusUnmerged = { fg = c.gitDecoration.conflictingResourceForeground },
    SnacksPickerGitStatusStaged = { fg = c.gitDecoration.stageModifiedResourceForeground },
    SnacksPickerGitNew = { fg = c.gitDecoration.untrackedResourceForeground },
    SnacksPickerGitFileNew = { link = "SnacksPickerGitNew" },
    SnacksPickerGitFileNewHL = { fg = c.base.green },
    SnacksPickerGitFolderNewHL = { link = "SnacksPickerGitFileNewHL" },

    -- Man pages
    SnacksPickerManSection = { fg = c.base.yellow },
    SnacksPickerManPage = { fg = c.base.purple },

    -- Window picker
    SnacksPickerPickWin = { link = "Search" },
    SnacksPickerPickWinCurrent = { link = "CurSearch" },

    -- LSP
    SnacksPickerLspDisabled = { fg = c.base.orange },
    SnacksPickerLspEnabled = { fg = c.base.green },
    SnacksPickerLspAttached = { fg = c.base.orange },
    SnacksPickerLspAttachedBuf = { fg = c.base.cyan },
    SnacksPickerLspUnavailable = { fg = c.base.red },

    -- Icons - base groups (using links to reduce redundancy)
    SnacksPickerIcon = { fg = c.base.purple },
    SnacksPickerIconSource = { link = "SnacksPickerIcon" },
    SnacksPickerIconName = { fg = c.base.yellow },
    SnacksPickerIconCategory = { fg = c.base.cyan },
    SnacksPickerIconDirectory = { fg = c.sideBar.foreground },
    SnacksPickerIconFolder = { link = "SnacksPickerIconDirectory" },

    -- Icons - LSP Kinds (link to corresponding BlinkCmpKind groups for consistency)
    SnacksPickerIconArray = { link = "BlinkCmpKindArray" },
    SnacksPickerIconBoolean = { link = "BlinkCmpKindBoolean" },
    SnacksPickerIconClass = { link = "BlinkCmpKindClass" },
    SnacksPickerIconConstant = { link = "BlinkCmpKindConstant" },
    SnacksPickerIconConstructor = { link = "BlinkCmpKindConstructor" },
    SnacksPickerIconEnum = { link = "BlinkCmpKindEnum" },
    SnacksPickerIconEnumMember = { link = "BlinkCmpKindEnumMember" },
    SnacksPickerIconEvent = { link = "BlinkCmpKindEvent" },
    SnacksPickerIconField = { link = "BlinkCmpKindField" },
    SnacksPickerIconFile = { fg = c.editor.foreground },
    SnacksPickerIconFunction = { link = "BlinkCmpKindFunction" },
    SnacksPickerIconInterface = { link = "BlinkCmpKindInterface" },
    SnacksPickerIconKey = { link = "BlinkCmpKindKey" },
    SnacksPickerIconMethod = { link = "BlinkCmpKindMethod" },
    SnacksPickerIconModule = { link = "BlinkCmpKindModule" },
    SnacksPickerIconNamespace = { link = "BlinkCmpKindNamespace" },
    SnacksPickerIconNull = { link = "BlinkCmpKindNull" },
    SnacksPickerIconNumber = { link = "BlinkCmpKindNumber" },
    SnacksPickerIconObject = { link = "BlinkCmpKindObject" },
    SnacksPickerIconOperator = { link = "BlinkCmpKindOperator" },
    SnacksPickerIconPackage = { link = "BlinkCmpKindPackage" },
    SnacksPickerIconProperty = { link = "BlinkCmpKindProperty" },
    SnacksPickerIconString = { link = "BlinkCmpKindString" },
    SnacksPickerIconStruct = { link = "BlinkCmpKindStruct" },
    SnacksPickerIconTypeParameter = { link = "BlinkCmpKindTypeParameter" },
    SnacksPickerIconVariable = { link = "BlinkCmpKindVariable" },

    -- ══════════════════════════════════════════════════════════════════════
    -- Explorer
    -- ══════════════════════════════════════════════════════════════════════
    SnacksExplorerNormal = { bg = sidebar_bg, fg = c.sideBar.foreground },
    SnacksExplorerNormalNC = { link = "SnacksExplorerNormal" },
    SnacksExplorerEndOfBuffer = { bg = sidebar_bg, fg = sidebar_bg },
    SnacksExplorerSignColumn = { bg = sidebar_bg, fg = c.sideBar.foreground },
    SnacksExplorerStatusLine = { bg = sidebar_bg, fg = sidebar_bg },
    SnacksExplorerBorder = {
      bg = sidebar_bg,
      fg = isExplorerBackgroundClear and c.base.black or sidebar_bg,
    },
    SnacksExplorerWinSeparator = {
      bg = c.editor.background,
      fg = isExplorerBackgroundClear and c.base.black or c.editor.background,
    },
    SnacksExplorerTitle = { bg = c.base.yellow, fg = sidebar_bg, bold = true },

    -- Cursor / Selection
    SnacksExplorerCursor = { bg = c.list.activeSelectionBackground, bg_base = sidebar_bg },
    SnacksExplorerCursorLine = { bg = c.list.activeSelectionBackground, bg_base = sidebar_bg, bold = true },
    SnacksExplorerCursorLineSign = { bg = c.list.activeSelectionBackground, bg_base = sidebar_bg },

    -- Directory / Files
    SnacksExplorerRootName = { bg = sidebar_bg, fg = c.sideBarSectionHeader.foreground, bold = true },
    SnacksExplorerDirectoryIcon = { bg = sidebar_bg, default = true },
    SnacksExplorerDirectoryName = { bg = sidebar_bg, fg = c.sideBar.foreground },
    SnacksExplorerFolderIcon = { link = "SnacksExplorerDirectoryIcon" },
    SnacksExplorerFolderName = { link = "SnacksExplorerDirectoryName" },
    SnacksExplorerOpenedFolderName = { bg = sidebar_bg, fg = c.sideBar.foreground, bold = true },
    SnacksExplorerEmptyFolderName = { link = "SnacksExplorerDirectoryName" },
    SnacksExplorerFileName = { bg = sidebar_bg, fg = c.sideBar.foreground, default = true },
    SnacksExplorerImageFile = { bg = sidebar_bg, fg = c.base.white },
    SnacksExplorerSpecialFile = { link = "SnacksExplorerImageFile" },
    SnacksExplorerSymlink = { link = "SnacksExplorerImageFile" },
    SnacksExplorerExecFile = { bg = sidebar_bg, fg = c.base.green },

    SnacksExplorerCursorLineFileName = {
      bg = explorer_selection_bg,
      bg_base = sidebar_bg,
      fg = c.sideBar.foreground,
      bold = true,
    },
    SnacksExplorerCursorLineFolderName = { link = "SnacksExplorerCursorLineFileName" },

    -- Line numbers
    SnacksExplorerLineNr = { bg = sidebar_bg, fg = c.editorLineNumber.foreground },
    SnacksExplorerCursorLineNr = {
      bg = explorer_selection_bg,
      bg_base = sidebar_bg,
      fg = c.editorLineNumber.activeForeground,
      bold = true,
    },
    SnacksExplorerFoldColumn = { bg = sidebar_bg, fg = c.editorLineNumber.foreground },

    -- Indent / Tree
    SnacksExplorerIndentMarker = { bg = sidebar_bg, link = "IndentBlanklineChar" },
    SnacksExplorerExpander = { bg = sidebar_bg, fg = c.sideBar.foreground },
    SnacksExplorerTree = { bg = sidebar_bg, fg = c.editorLineNumber.foreground },

    -- Git decorations (base groups)
    SnacksGitNew = { fg = c.base.green },
    SnacksGitUntracked = { link = "SnacksGitNew" },
    SnacksExplorerGitAdded = { bg = sidebar_bg, fg = c.gitDecoration.addedResourceForeground },
    SnacksExplorerGitNew = { bg = sidebar_bg, fg = c.base.green },
    SnacksExplorerGitModified = { bg = sidebar_bg, fg = c.gitDecoration.modifiedResourceForeground },
    SnacksExplorerGitDeleted = { bg = sidebar_bg, fg = c.gitDecoration.deletedResourceForeground },
    SnacksExplorerGitRenamed = { bg = sidebar_bg, fg = c.gitDecoration.untrackedResourceForeground },
    SnacksExplorerGitUntracked = { link = "SnacksExplorerGitNew" },
    SnacksExplorerGitIgnored = { bg = sidebar_bg, fg = c.gitDecoration.ignoredResourceForeground },
    SnacksExplorerGitStaged = { bg = sidebar_bg, fg = c.gitDecoration.stageModifiedResourceForeground },
    SnacksExplorerGitConflict = { bg = sidebar_bg, fg = c.gitDecoration.conflictingResourceForeground },
    SnacksExplorerGitDirty = { link = "SnacksExplorerGitModified" },
    SnacksExplorerGitMerge = { link = "SnacksExplorerGitConflict" },
    SnacksExplorerGitFileNew = { link = "SnacksExplorerGitNew" },
    SnacksExplorerGitFileUntracked = { link = "SnacksExplorerGitNew" },
    SnacksExplorerGitFolderNew = { link = "SnacksExplorerGitNew" },
    SnacksExplorerGitFolderUntracked = { link = "SnacksExplorerGitNew" },

    -- Float
    SnacksExplorerFloatNormal = { bg = c.editorSuggestWidget.background, fg = c.editorSuggestWidget.foreground },
    SnacksExplorerFloatBorder = { bg = sidebar_bg, fg = c.editorSuggestWidget.background },
    SnacksExplorerFloatTitle = { bg = c.base.yellow, fg = sidebar_bg, bold = true },

    -- Tabs
    SnacksExplorerTabActive = { bg = c.button.hoverBackground, fg = c.button.foreground, bold = true },
    SnacksExplorerTabInactive = { bg = c.button.background, fg = c.button.foreground },
    SnacksExplorerTabSeparatorActive = { bg = c.button.hoverBackground, fg = c.button.separator },
    SnacksExplorerTabSeparatorInactive = { bg = c.button.background, fg = c.button.separator },

    -- ══════════════════════════════════════════════════════════════════════
    -- Dashboard
    -- ══════════════════════════════════════════════════════════════════════
    SnacksDashboardNormal = { bg = c.editor.background, fg = c.editor.foreground },
    SnacksDashboardDesc = { fg = c.base.dimmed1 },
    SnacksDashboardIcon = { fg = c.base.orange },
    SnacksDashboardKey = { fg = c.base.yellow, bold = true },
    SnacksDashboardFooter = { fg = c.base.dimmed2, italic = true },
    SnacksDashboardHeader = { fg = c.base.yellow },
    SnacksDashboardTitle = { fg = c.base.purple, bold = true },
    SnacksDashboardSpecial = { fg = c.base.purple },
    SnacksDashboardDir = { fg = c.base.dimmed1 },
    SnacksDashboardFile = { fg = c.base.white },
    SnacksDashboardTerminal = { fg = c.base.green },

    -- ══════════════════════════════════════════════════════════════════════
    -- Indent
    -- ══════════════════════════════════════════════════════════════════════
    SnacksIndent = { fg = c.editorIndentGuide.background, nocombine = true },
    SnacksIndentBlank = { link = "SnacksIndent" },
    SnacksIndentScope = { fg = c.editorIndentGuide.activeBackground, nocombine = true },
    SnacksIndentChunk = { link = "SnacksIndentScope" },
    -- Rainbow indent levels
    SnacksIndent1 = { fg = c.base.cyan, nocombine = true },
    SnacksIndent2 = { fg = c.base.green, nocombine = true },
    SnacksIndent3 = { fg = c.base.orange, nocombine = true },
    SnacksIndent4 = { fg = c.base.red, nocombine = true },
    SnacksIndent5 = { link = "SnacksIndent1" },
    SnacksIndent6 = { link = "SnacksIndent2" },
    SnacksIndent7 = { link = "SnacksIndent3" },
    SnacksIndent8 = { link = "SnacksIndent4" },

    -- ══════════════════════════════════════════════════════════════════════
    -- Notifier
    -- ══════════════════════════════════════════════════════════════════════
    SnacksNotifierHistory = { bg = c.editor.background, fg = c.editor.foreground },

    -- Info
    SnacksNotifierInfo = { fg = c.base.cyan },
    SnacksNotifierIconInfo = { link = "SnacksNotifierInfo" },
    SnacksNotifierBorderInfo = { link = "SnacksNotifierInfo" },
    SnacksNotifierTitleInfo = { fg = c.base.cyan, bold = true },
    SnacksNotifierFooterInfo = { fg = c.base.dimmed2 },

    -- Warn
    SnacksNotifierWarn = { fg = c.base.orange },
    SnacksNotifierIconWarn = { link = "SnacksNotifierWarn" },
    SnacksNotifierBorderWarn = { link = "SnacksNotifierWarn" },
    SnacksNotifierTitleWarn = { fg = c.base.orange, bold = true },
    SnacksNotifierFooterWarn = { fg = c.base.dimmed2 },

    -- Error
    SnacksNotifierError = { fg = c.base.red },
    SnacksNotifierIconError = { link = "SnacksNotifierError" },
    SnacksNotifierBorderError = { link = "SnacksNotifierError" },
    SnacksNotifierTitleError = { fg = c.base.red, bold = true },
    SnacksNotifierFooterError = { fg = c.base.dimmed2 },

    -- Debug
    SnacksNotifierDebug = { fg = c.base.dimmed1 },
    SnacksNotifierIconDebug = { link = "SnacksNotifierDebug" },
    SnacksNotifierBorderDebug = { link = "SnacksNotifierDebug" },
    SnacksNotifierTitleDebug = { fg = c.base.dimmed1, bold = true },
    SnacksNotifierFooterDebug = { fg = c.base.dimmed2 },

    -- Trace
    SnacksNotifierTrace = { fg = c.base.dimmed1 },
    SnacksNotifierIconTrace = { link = "SnacksNotifierTrace" },
    SnacksNotifierBorderTrace = { link = "SnacksNotifierTrace" },
    SnacksNotifierTitleTrace = { fg = c.base.dimmed1, bold = true },
    SnacksNotifierFooterTrace = { fg = c.base.dimmed2 },

    -- ══════════════════════════════════════════════════════════════════════
    -- Input
    -- ══════════════════════════════════════════════════════════════════════
    SnacksInputNormal = { bg = c.editor.background, fg = c.editor.foreground },
    SnacksInputBorder = { fg = c.tab.unfocusedActiveBorder },
    SnacksInputTitle = { fg = c.base.yellow, bold = true },
    SnacksInputIcon = { fg = c.base.purple },
    SnacksInputPrompt = { fg = c.base.yellow },
    SnacksInputCursor = { bg = c.base.white, fg = c.editor.background },

    -- ══════════════════════════════════════════════════════════════════════
    -- Scratch
    -- ══════════════════════════════════════════════════════════════════════
    SnacksScratchNormal = { bg = c.editor.background, fg = c.editor.foreground },
    SnacksScratchBorder = { fg = c.tab.unfocusedActiveBorder },
    SnacksScratchDesc = { fg = c.base.dimmed1 },
    SnacksScratchIcon = { fg = c.base.purple },
    SnacksScratchTitle = { fg = c.base.purple, bold = true },
    SnacksScratchKey = { fg = c.base.yellow, bold = true },
    SnacksScratchFooter = { fg = c.base.dimmed2 },

    -- ══════════════════════════════════════════════════════════════════════
    -- Terminal & Lazygit
    -- ══════════════════════════════════════════════════════════════════════
    SnacksTerminalNormal = { bg = c.terminal.background, fg = c.terminal.foreground },
    SnacksTerminalBorder = { fg = c.tab.unfocusedActiveBorder },
    SnacksTerminalTitle = { fg = c.base.green, bold = true },
    SnacksLazygitNormal = { bg = c.editor.background, fg = c.editor.foreground },
    SnacksLazygitBorder = { fg = c.base.purple },
    SnacksLazygitTitle = { fg = c.base.purple, bold = true },

    -- ══════════════════════════════════════════════════════════════════════
    -- Miscellaneous
    -- ══════════════════════════════════════════════════════════════════════
    SnacksDim = { fg = c.base.dimmed2 },
    SnacksWordsCurrent = { bg = c.editor.wordHighlightBackground },
    SnacksWords = { link = "SnacksWordsCurrent" },
    SnacksScrollBar = { fg = c.scrollbarSlider.hoverBackground },

    -- Zen
    SnacksZenNormal = { bg = c.editor.background, fg = c.editor.foreground },
    SnacksZenBorder = { fg = c.editor.background },
    SnacksZenBackdrop = { bg = c.base.dark },
    SnacksZenIcon = { fg = c.base.purple },

    -- Toggle
    SnacksToggleOn = { fg = c.base.green },
    SnacksToggleOff = { fg = c.base.dimmed2 },

    -- Profiler
    SnacksProfilerNormal = { bg = c.editor.background, fg = c.editor.foreground },
    SnacksProfilerBorder = { fg = c.tab.unfocusedActiveBorder },
    SnacksProfilerTitle = { fg = c.base.purple, bold = true },
    SnacksProfilerIconInfo = { bg = hp.blend(c.base.cyan, 0.3), fg = c.base.cyan },
    SnacksProfilerBadgeInfo = { bg = hp.blend(c.base.cyan, 0.1), fg = c.base.cyan },
    SnacksProfilerIconTrace = { bg = hp.blend(c.base.dimmed3, 0.3), fg = c.base.dimmed3 },
    SnacksProfilerBadgeTrace = { bg = hp.blend(c.base.dimmed3, 0.1), fg = c.base.dimmed3 },
    SnacksProfilerBadge = { bg = c.base.dimmed5, fg = c.base.white },
    SnacksProfilerH1 = { fg = c.base.yellow, bold = true },
    SnacksProfilerH2 = { fg = c.base.purple, bold = true },
    SnacksFooterKey = { link = "SnacksProfilerIconInfo" },
    SnacksFooterDesc = { link = "SnacksProfilerBadgeInfo" },

    -- Image
    SnacksImageLoading = { fg = c.base.dimmed1 },
    SnacksImageError = { fg = c.base.red },

    -- Status Column
    SnacksStatusColumnMark = { fg = c.base.yellow },

    -- GitHub (for picker)
    SnacksGhLabel = { fg = c.base.cyan, bold = true },
    SnacksGhDiffHeader = { bg = hp.blend(c.base.cyan, 0.1), fg = c.base.cyan },
  }
end

return M
