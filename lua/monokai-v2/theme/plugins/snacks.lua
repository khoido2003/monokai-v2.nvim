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
  -- Explorer selection background
  local explorer_selection_bg = c.list.activeSelectionBackground

  return {

    SnacksNormal = { bg = c.editor.background, fg = c.editor.foreground },
    SnacksNormalNC = { bg = c.editor.background, fg = c.editor.foreground },
    SnacksBorder = { fg = c.tab.unfocusedActiveBorder },
    SnacksFooter = { fg = c.base.dimmed2 },
    SnacksBackdrop = { bg = c.base.dark },
    SnacksWinBar = { bg = c.editor.background, fg = c.editor.foreground },
    SnacksWinBarNC = { bg = c.editor.background, fg = c.base.dimmed2 },

    -- Windows
    SnacksWinKey = { fg = c.base.yellow, bold = true },
    SnacksWinKeySep = { fg = c.base.dimmed1 },

    -- Picker
    SnacksPickerLineNr = isPickerBackgroundClear and {
      bg = transparent_bg,
      fg = c.editorLineNumber.foreground,
    } or {
      bg = result_bg,
      fg = c.editorLineNumber.foreground,
    },
    SnacksPickerCursorLineNr = {
      bg = picker_selection_bg,
      fg = c.editorLineNumber.activeForeground,
      bold = true,
    },
    SnacksPickerSignColumn = isPickerBackgroundClear and {
      bg = transparent_bg,
      fg = c.editorLineNumber.foreground,
    } or {
      bg = result_bg,
      fg = c.editorLineNumber.foreground,
    },
    -- FoldColumn to match picker background
    SnacksPickerFoldColumn = isPickerBackgroundClear and {
      bg = transparent_bg,
      fg = c.editorLineNumber.foreground,
    } or {
      bg = result_bg,
      fg = c.editorLineNumber.foreground,
    },
    -- EndOfBuffer to match picker background
    SnacksPickerEndOfBuffer = isPickerBackgroundClear and {
      bg = transparent_bg,
      fg = transparent_bg,
    } or {
      bg = result_bg,
      fg = result_bg,
    },
    -- CursorLine for full row highlight
    SnacksPickerCursorLine = {
      bg = picker_selection_bg,
    },

    -- Main picker window
    SnacksPicker = isPickerBackgroundClear and {
      bg = transparent_bg,
      fg = picker_fg,
    } or {
      bg = c.editorHoverWidget.background,
      fg = picker_fg,
    },

    -- Border
    SnacksPickerBorder = isPickerBackgroundClear and {
      bg = transparent_bg,
      fg = c.tab.unfocusedActiveBorder,
    } or {
      bg = c.editor.background,
      fg = c.editorHoverWidget.background,
    },

    -- Title
    SnacksPickerTitle = {
      bg = config.filter == "light" and c.base.red or c.base.yellow,
      fg = c.base.black,
      bold = true,
    },

    -- Prompt
    SnacksPickerPrompt = { fg = c.base.yellow },
    SnacksPickerPromptNormal = isPickerBackgroundClear and {
      bg = transparent_bg,
      fg = picker_fg,
    } or {
      bg = prompt_bg,
      fg = picker_fg,
    },
    SnacksPickerPromptBorder = isPickerBackgroundClear and {
      bg = transparent_bg,
      fg = transparent_bg_border,
    } or {
      bg = transparent_bg,
      fg = prompt_bg,
    },
    SnacksPickerPromptTitle = {
      bg = config.filter == "light" and c.base.red or c.base.yellow,
      fg = c.base.black,
      bold = true,
    },
    SnacksPickerPromptPrefix = { fg = c.base.white },

    -- Input (same background as prompt for consistency)
    SnacksPickerInput = isPickerBackgroundClear and {
      bg = transparent_bg,
      fg = picker_fg,
    } or {
      bg = prompt_bg,
      fg = picker_fg,
    },
    SnacksPickerInputBorder = isPickerBackgroundClear and {
      bg = transparent_bg,
      fg = transparent_bg_border,
    } or {
      bg = transparent_bg,
      fg = prompt_bg,
    },
    SnacksPickerInputTitle = {
      bg = config.filter == "light" and c.base.red or c.base.yellow,
      fg = c.base.black,
      bold = true,
    },

    -- Preview
    SnacksPickerPreview = isPickerBackgroundClear and {
      bg = transparent_bg,
      fg = picker_fg,
    } or {
      bg = preview_bg,
      fg = picker_fg,
    },
    SnacksPickerPreviewNormal = isPickerBackgroundClear and {
      bg = transparent_bg,
      fg = picker_fg,
    } or {
      bg = preview_bg,
      fg = picker_fg,
    },
    SnacksPickerPreviewBorder = isPickerBackgroundClear and {
      bg = transparent_bg,
      fg = transparent_bg_border,
    } or {
      bg = transparent_bg,
      fg = preview_bg,
    },
    SnacksPickerPreviewTitle = {
      bg = config.filter == "light" and c.base.red or c.base.yellow,
      fg = c.base.black,
      bold = true,
    },
    SnacksPickerPreviewLine = isPickerBackgroundClear and {
      bg = hp.blend(c.editorSuggestWidget.selectedBackground, 0.3, transparent_bg),
      bold = true,
    } or {
      bg = hp.blend(c.base.green, 0.2, result_bg),
      bold = true,
    },

    -- List / Results
    SnacksPickerList = isPickerBackgroundClear and {
      bg = transparent_bg,
      fg = picker_fg,
    } or {
      bg = result_bg,
      fg = picker_fg,
    },
    SnacksPickerListNormal = isPickerBackgroundClear and {
      bg = transparent_bg,
      fg = picker_fg,
    } or {
      bg = result_bg,
      fg = picker_fg,
    },
    SnacksPickerListBorder = isPickerBackgroundClear and {
      bg = transparent_bg,
      fg = transparent_bg_border,
    } or {
      bg = transparent_bg,
      fg = result_bg,
    },
    SnacksPickerListTitle = {
      bg = config.filter == "light" and c.base.red or c.base.yellow,
      fg = c.base.black,
      bold = true,
    },
    SnacksPickerListCursorLine = isPickerBackgroundClear and {
      bg = hp.blend(c.editorSuggestWidget.selectedBackground, 0.3, transparent_bg),
      bold = true,
    } or {
      bg = hp.blend(c.base.green, 0.2, result_bg),
      bold = true,
    },

    -- Selection
    SnacksPickerSelection = isPickerBackgroundClear and {
      bg = hp.blend(c.editorSuggestWidget.selectedBackground, 0.3, transparent_bg),
      bold = true,
    } or {
      bg = hp.blend(c.base.green, 0.2, result_bg),
      bold = true,
    },
    SnacksPickerSelectionCaret = isPickerBackgroundClear and {
      bg = hp.blend(c.editorSuggestWidget.selectedBackground, 0.3, transparent_bg),
      fg = c.base.green,
      bold = true,
    } or {
      bg = hp.blend(c.base.green, 0.2, result_bg),
      fg = c.base.green,
    },

    -- Matching
    SnacksPickerMatch = {
      fg = config.filter == "light" and c.base.red or c.base.yellow,
      bold = true,
    },
    SnacksPickerSearch = { link = "Search" },

    -- Files/Paths
    SnacksPickerFile = { fg = c.base.white },
    SnacksPickerDir = { fg = c.base.dimmed1 },
    SnacksPickerDirectory = { fg = c.sideBar.foreground },
    SnacksPickerLink = { fg = c.base.cyan, italic = true },
    SnacksPickerLinkBroken = { fg = c.base.red, italic = true },

    -- Code locations
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
    SnacksPickerGitFileNew = { fg = c.gitDecoration.untrackedResourceForeground },
    SnacksPickerGitFileNewHL = { fg = c.base.green },
    SnacksPickerGitFolderNewHL = { fg = c.base.green },

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

    -- Icons (LSP Symbol Kinds)
    SnacksPickerIcon = { fg = c.base.purple },
    SnacksPickerIconSource = { fg = c.base.purple },
    SnacksPickerIconName = { fg = c.base.yellow },
    SnacksPickerIconCategory = { fg = c.base.cyan },
    SnacksPickerIconArray = { fg = c.base.orange },
    SnacksPickerIconBoolean = { fg = c.base.purple },
    SnacksPickerIconClass = { fg = c.base.cyan },
    SnacksPickerIconConstant = { fg = c.base.purple },
    SnacksPickerIconConstructor = { fg = c.base.cyan },
    SnacksPickerIconEnum = { fg = c.base.cyan },
    SnacksPickerIconEnumMember = { fg = c.base.purple },
    SnacksPickerIconEvent = { fg = c.base.purple },
    SnacksPickerIconField = { fg = c.base.white },
    SnacksPickerIconFile = { fg = c.editor.foreground },
    SnacksPickerIconFunction = { fg = c.base.green },
    SnacksPickerIconInterface = { fg = c.base.cyan },
    SnacksPickerIconKey = { fg = c.base.yellow },
    SnacksPickerIconMethod = { fg = c.base.green },
    SnacksPickerIconModule = { fg = c.base.cyan },
    SnacksPickerIconNamespace = { fg = c.base.cyan },
    SnacksPickerIconNull = { fg = c.base.purple },
    SnacksPickerIconNumber = { fg = c.base.purple },
    SnacksPickerIconObject = { fg = c.base.purple },
    SnacksPickerIconOperator = { fg = c.base.red },
    SnacksPickerIconPackage = { fg = c.base.cyan },
    SnacksPickerIconProperty = { fg = c.base.white },
    SnacksPickerIconString = { fg = c.base.yellow },
    SnacksPickerIconStruct = { fg = c.base.cyan },
    SnacksPickerIconTypeParameter = { fg = c.base.cyan },
    SnacksPickerIconVariable = { fg = c.base.white },

    -- Folder/Directory
    SnacksPickerIconDirectory = isPickerBackgroundClear and {
      bg = transparent_bg,
      fg = c.sideBar.foreground,
    } or {
      bg = result_bg,
      fg = c.sideBar.foreground,
    },
    SnacksPickerIconFolder = isPickerBackgroundClear and {
      bg = transparent_bg,
      fg = c.sideBar.foreground,
    } or {
      bg = result_bg,
      fg = c.sideBar.foreground,
    },

    -- Explorer
    SnacksExplorerNormal = { bg = sidebar_bg, fg = c.sideBar.foreground },
    SnacksExplorerNormalNC = { bg = sidebar_bg, fg = c.sideBar.foreground },
    SnacksExplorerEndOfBuffer = { bg = sidebar_bg, fg = sidebar_bg },
    SnacksExplorerSignColumn = { bg = sidebar_bg, fg = c.sideBar.foreground },
    SnacksExplorerStatusLine = { bg = sidebar_bg, fg = sidebar_bg },

    -- Border
    SnacksExplorerBorder = {
      bg = sidebar_bg,
      fg = isExplorerBackgroundClear and c.base.black or sidebar_bg,
    },
    SnacksExplorerWinSeparator = {
      bg = c.editor.background,
      fg = isExplorerBackgroundClear and c.base.black or c.editor.background,
    },

    -- Title
    SnacksExplorerTitle = {
      bg = c.base.yellow,
      fg = sidebar_bg,
      bold = true,
    },

    -- Cursor / Selection
    SnacksExplorerCursor = {
      bg = c.list.activeSelectionBackground,
      bg_base = sidebar_bg,
    },
    SnacksExplorerCursorLine = {
      bg = c.list.activeSelectionBackground,
      bg_base = sidebar_bg,
      bold = true,
    },
    SnacksExplorerCursorLineSign = {
      bg = c.list.activeSelectionBackground,
      bg_base = sidebar_bg,
    },

    -- Directory / Files
    SnacksExplorerRootName = {
      bg = sidebar_bg,
      fg = c.sideBarSectionHeader.foreground,
      bold = true,
    },
    SnacksExplorerDirectoryIcon = { bg = sidebar_bg, default = true },
    SnacksExplorerDirectoryName = { bg = sidebar_bg, fg = c.sideBar.foreground },
    SnacksExplorerFolderIcon = { bg = sidebar_bg, default = true },
    SnacksExplorerFolderName = { bg = sidebar_bg, fg = c.sideBar.foreground },
    SnacksExplorerOpenedFolderName = { bg = sidebar_bg, fg = c.sideBar.foreground, bold = true },
    SnacksExplorerEmptyFolderName = { bg = sidebar_bg, fg = c.sideBar.foreground },
    SnacksExplorerFileName = {
      bg = sidebar_bg,
      fg = c.sideBar.foreground,
      default = true,
    },
    SnacksExplorerImageFile = { bg = sidebar_bg, fg = c.base.white },
    SnacksExplorerSpecialFile = { bg = sidebar_bg, fg = c.base.white },
    SnacksExplorerSymlink = { bg = sidebar_bg, fg = c.base.white },
    SnacksExplorerExecFile = { bg = sidebar_bg, fg = c.base.green },

    SnacksExplorerCursorLineFileName = {
      bg = explorer_selection_bg,
      bg_base = sidebar_bg,
      fg = c.sideBar.foreground,
      bold = true,
    },
    SnacksExplorerCursorLineFolderName = {
      bg = explorer_selection_bg,
      bg_base = sidebar_bg,
      fg = c.sideBar.foreground,
      bold = true,
    },

    -- Explorer line numbers
    SnacksExplorerLineNr = {
      bg = sidebar_bg,
      fg = c.editorLineNumber.foreground,
    },
    SnacksExplorerCursorLineNr = {
      bg = explorer_selection_bg,
      bg_base = sidebar_bg,
      fg = c.editorLineNumber.activeForeground,
      bold = true,
    },
    SnacksExplorerFoldColumn = {
      bg = sidebar_bg,
      fg = c.editorLineNumber.foreground,
    },

    -- Indent / Tree
    SnacksExplorerIndentMarker = { bg = sidebar_bg, link = "IndentBlanklineChar" },
    SnacksExplorerExpander = { bg = sidebar_bg, fg = c.sideBar.foreground },
    SnacksExplorerTree = { bg = sidebar_bg, fg = c.editorLineNumber.foreground },

    -- Git decorations
    SnacksGitNew = { fg = c.base.green },
    SnacksGitUntracked = { fg = c.base.green },
    SnacksExplorerGitAdded = { bg = sidebar_bg, fg = c.gitDecoration.addedResourceForeground },
    SnacksExplorerGitNew = { bg = sidebar_bg, fg = c.base.green },
    SnacksExplorerGitModified = { bg = sidebar_bg, fg = c.gitDecoration.modifiedResourceForeground },
    SnacksExplorerGitDeleted = { bg = sidebar_bg, fg = c.gitDecoration.deletedResourceForeground },
    SnacksExplorerGitRenamed = { bg = sidebar_bg, fg = c.gitDecoration.untrackedResourceForeground },
    SnacksExplorerGitUntracked = { bg = sidebar_bg, fg = c.base.green },
    SnacksExplorerGitIgnored = { bg = sidebar_bg, fg = c.gitDecoration.ignoredResourceForeground },
    SnacksExplorerGitStaged = { bg = sidebar_bg, fg = c.gitDecoration.stageModifiedResourceForeground },
    SnacksExplorerGitConflict = { bg = sidebar_bg, fg = c.gitDecoration.conflictingResourceForeground },
    SnacksExplorerGitDirty = { bg = sidebar_bg, fg = c.gitDecoration.modifiedResourceForeground },
    SnacksExplorerGitMerge = { bg = sidebar_bg, fg = c.gitDecoration.conflictingResourceForeground },

    -- Additional git file highlight groups for new/untracked files (GREEN)
    SnacksExplorerGitFileNew = { bg = sidebar_bg, fg = c.base.green },
    SnacksExplorerGitFileUntracked = { bg = sidebar_bg, fg = c.base.green },
    SnacksExplorerGitFolderNew = { bg = sidebar_bg, fg = c.base.green },
    SnacksExplorerGitFolderUntracked = { bg = sidebar_bg, fg = c.base.green },

    -- Float
    SnacksExplorerFloatNormal = {
      bg = c.editorSuggestWidget.background,
      fg = c.editorSuggestWidget.foreground,
    },
    SnacksExplorerFloatBorder = {
      bg = sidebar_bg,
      fg = c.editorSuggestWidget.background,
    },
    SnacksExplorerFloatTitle = {
      bg = c.base.yellow,
      fg = sidebar_bg,
      bold = true,
    },

    -- Tabs
    SnacksExplorerTabActive = {
      bg = c.button.hoverBackground,
      fg = c.button.foreground,
      bold = true,
    },
    SnacksExplorerTabInactive = { bg = c.button.background, fg = c.button.foreground },
    SnacksExplorerTabSeparatorActive = {
      bg = c.button.hoverBackground,
      fg = c.button.separator,
    },
    SnacksExplorerTabSeparatorInactive = {
      bg = c.button.background,
      fg = c.button.separator,
    },

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

    SnacksIndent = { fg = c.editorIndentGuide.background },
    SnacksIndentBlank = { fg = c.editorIndentGuide.background },
    SnacksIndentScope = { fg = c.editorIndentGuide.activeBackground },
    SnacksIndentChunk = { fg = c.editorIndentGuide.activeBackground },
    -- Rainbow indent levels
    SnacksIndent1 = { fg = c.base.cyan },
    SnacksIndent2 = { fg = c.base.green },
    SnacksIndent3 = { fg = c.base.orange },
    SnacksIndent4 = { fg = c.base.red },
    SnacksIndent5 = { fg = c.base.cyan },
    SnacksIndent6 = { fg = c.base.green },
    SnacksIndent7 = { fg = c.base.orange },
    SnacksIndent8 = { fg = c.base.red },

    SnacksNotifierHistory = { bg = c.editor.background, fg = c.editor.foreground },

    -- Info
    SnacksNotifierInfo = { fg = c.base.cyan },
    SnacksNotifierIconInfo = { fg = c.base.cyan },
    SnacksNotifierBorderInfo = { fg = c.base.cyan },
    SnacksNotifierTitleInfo = { fg = c.base.cyan, bold = true },
    SnacksNotifierFooterInfo = { fg = c.base.dimmed2 },

    -- Warn
    SnacksNotifierWarn = { fg = c.base.orange },
    SnacksNotifierIconWarn = { fg = c.base.orange },
    SnacksNotifierBorderWarn = { fg = c.base.orange },
    SnacksNotifierTitleWarn = { fg = c.base.orange, bold = true },
    SnacksNotifierFooterWarn = { fg = c.base.dimmed2 },

    -- Error
    SnacksNotifierError = { fg = c.base.red },
    SnacksNotifierIconError = { fg = c.base.red },
    SnacksNotifierBorderError = { fg = c.base.red },
    SnacksNotifierTitleError = { fg = c.base.red, bold = true },
    SnacksNotifierFooterError = { fg = c.base.dimmed2 },

    -- Debug
    SnacksNotifierDebug = { fg = c.base.dimmed1 },
    SnacksNotifierIconDebug = { fg = c.base.dimmed1 },
    SnacksNotifierBorderDebug = { fg = c.base.dimmed1 },
    SnacksNotifierTitleDebug = { fg = c.base.dimmed1, bold = true },
    SnacksNotifierFooterDebug = { fg = c.base.dimmed2 },

    -- Trace
    SnacksNotifierTrace = { fg = c.base.dimmed1 },
    SnacksNotifierIconTrace = { fg = c.base.dimmed1 },
    SnacksNotifierBorderTrace = { fg = c.base.dimmed1 },
    SnacksNotifierTitleTrace = { fg = c.base.dimmed1, bold = true },
    SnacksNotifierFooterTrace = { fg = c.base.dimmed2 },

    -- Input
    SnacksInputNormal = { bg = c.editor.background, fg = c.editor.foreground },
    SnacksInputBorder = { fg = c.tab.unfocusedActiveBorder },
    SnacksInputTitle = { fg = c.base.yellow, bold = true },
    SnacksInputIcon = { fg = c.base.purple },
    SnacksInputPrompt = { fg = c.base.yellow },
    SnacksInputCursor = { bg = c.base.white, fg = c.editor.background },

    -- Scratch
    SnacksScratchNormal = { bg = c.editor.background, fg = c.editor.foreground },
    SnacksScratchBorder = { fg = c.tab.unfocusedActiveBorder },
    SnacksScratchDesc = { fg = c.base.dimmed1 },
    SnacksScratchIcon = { fg = c.base.purple },
    SnacksScratchTitle = { fg = c.base.purple, bold = true },
    SnacksScratchKey = { fg = c.base.yellow, bold = true },
    SnacksScratchFooter = { fg = c.base.dimmed2 },

    -- Terminal
    SnacksTerminalNormal = { bg = c.terminal.background, fg = c.terminal.foreground },
    SnacksTerminalBorder = { fg = c.tab.unfocusedActiveBorder },
    SnacksTerminalTitle = { fg = c.base.green, bold = true },

    -- Lazygit
    SnacksLazygitNormal = { bg = c.editor.background, fg = c.editor.foreground },
    SnacksLazygitBorder = { fg = c.base.purple },
    SnacksLazygitTitle = { fg = c.base.purple, bold = true },

    -- Dim
    SnacksDim = { fg = c.base.dimmed2 },

    -- Words
    SnacksWordsCurrent = { bg = c.editor.wordHighlightBackground },
    SnacksWords = { bg = c.editor.wordHighlightBackground },

    -- Scroll
    SnacksScrollBar = { fg = c.scrollbarSlider.hoverBackground },

    -- Zen
    SnacksZenNormal = { bg = c.editor.background, fg = c.editor.foreground },
    SnacksZenBorder = { fg = c.editor.background },
    SnacksZenBackdrop = { bg = c.base.dark },

    -- Toggle
    SnacksToggleOn = { fg = c.base.green },
    SnacksToggleOff = { fg = c.base.dimmed2 },

    -- Profiler
    SnacksProfilerNormal = { bg = c.editor.background, fg = c.editor.foreground },
    SnacksProfilerBorder = { fg = c.tab.unfocusedActiveBorder },
    SnacksProfilerTitle = { fg = c.base.purple, bold = true },
    SnacksProfilerIconInfo = { fg = c.base.cyan },
    SnacksProfilerBadge = { bg = c.base.dimmed5, fg = c.base.white },
    SnacksProfilerH1 = { fg = c.base.yellow, bold = true },
    SnacksProfilerH2 = { fg = c.base.purple, bold = true },

    -- Image
    SnacksImageLoading = { fg = c.base.dimmed1 },
    SnacksImageError = { fg = c.base.red },

    -- Status Column
    SnacksStatusColumnMark = { fg = c.base.yellow },
  }
end

return M
