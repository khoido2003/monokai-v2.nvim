local Util = require("monokai-v2.util")
local Config = require("monokai-v2.config")

---@class ColorschemeOptions
local cs = {}

local cached_cs = {}
local cached_filter = nil

---@class Colorscheme: ColorschemeOptions
local M = {
  filter = nil,
}

setmetatable(M, {
  __index = function(_, k)
    if k == "filter" then
      return cached_filter or require("monokai-v2.config").filter
    end

    local current_filter = require("monokai-v2.config").filter
    if cached_filter ~= current_filter or not cached_cs[k] then
      cached_cs = M.get(current_filter)
      cached_filter = current_filter
    end
    return cached_cs[k]
  end,
  __call = function(t, ...)
    return t.get(...)
  end,
})

local hp = require("monokai-v2.color_helper")

---@param filter Filter
---@return ColorschemeOptions
M.get = function(filter)
  local filters = { "light", "classic", "machine", "octagon", "pro", "ristretto", "spectrum" }

  if not vim.tbl_contains(filters, filter) then
    local msg = 'Invalid filter, expected  "light", "classic", "machine", "octagon", "pro", "ristretto" or "spectrum"'
    local level = "info"
    filter = "pro"
    Util.log(msg, level)
  end

  M.filter = filter

  ---@module "monokai-v2.colorscheme.palette.pro"
  local monokai_palette = require("monokai-v2.colorscheme.palette." .. M.filter)
  local p =
    vim.tbl_deep_extend("force", monokai_palette, Config.overridePalette and Config.overridePalette(filter) or {})

  cs.editor = {
    background = Config.transparent_background and "NONE" or p.background,
    foreground = p.foreground,
    lineHighlightBackground = hp.blend(p.foreground, 0.05, p.background),
    selectionBackground = hp.blend(p.neutral1, 0.15, p.background),
    findMatchBackground = hp.blend(p.foreground, 0.15, p.background),
    findMatchBorder = Config.filter == "light" and p.red or p.yellow,
    findMatchHighlightBackground = hp.blend(p.foreground, 0.15, p.background),
    foldBackground = hp.blend(p.foreground, 0.1, p.background),
    wordHighlightBackground = hp.blend(p.foreground, 0.15, p.background),
    selectionHighlightBackground = hp.blend(p.foreground, 0.15, p.background),
    wordHighlightStrongBackground = hp.blend(p.foreground, 0.15, p.background),
  }

  cs.editorLineNumber = {
    foreground = p.neutral4,
    activeForeground = p.neutral1,
  }

  cs.editorHoverWidget = {
    background = p.neutral5,
    border = p.background,
  }

  cs.editorSuggestWidget = {
    background = p.neutral5,
    border = p.neutral5,
    foreground = p.neutral1,
    highlightForeground = Config.filter == "light" and p.red or p.yellow,
    selectedBackground = p.neutral3,
  }

  cs.editorIndentGuide = {
    background = p.neutral5,
    activeBackground = p.neutral3,
  }

  cs.editorInlayHint = {
    background = p.neutral5,
    foreground = p.neutral2,
  }

  cs.editorGutter = {
    addedBackground = p.green,
    deletedBackground = p.red,
    modifiedBackground = p.orange,
  }

  cs.sideBar = {
    background = p.surface1,
    foreground = p.neutral2,
  }

  cs.sideBarTitle = {
    foreground = p.neutral4,
  }

  cs.list = { activeSelectionBackground = hp.blend(p.foreground, 0.11, cs.sideBar.background) }

  cs.sideBarSectionHeader = { background = p.surface1, foreground = p.neutral1 }

  cs.breadcrumb = {
    foreground = p.neutral2,
  }

  cs.button = {
    background = p.neutral5,
    foreground = p.neutral1,
    hoverBackground = p.neutral4,
    separator = p.background,
  }

  cs.scrollbarSlider = {
    hoverBackground = hp.blend(p.neutral1, 0.15, p.background),
  }

  cs.gitDecoration = {
    addedResourceForeground = p.green,
    conflictingResourceForeground = p.orange,
    deletedResourceForeground = p.red,
    ignoredResourceForeground = p.neutral4,
    modifiedResourceForeground = p.yellow,
    stageDeletedResourceForeground = p.red,
    stageModifiedResourceForeground = p.yellow,
    untrackedResourceForeground = p.neutral2,
  }

  cs.inputValidation = {
    errorBackground = p.neutral5,
    errorBorder = p.red,
    errorForeground = p.red,
    infoBackground = p.neutral5,
    infoBorder = p.cyan,
    infoForeground = p.cyan,
    hintBackground = p.neutral5,
    hintForeground = p.green,
    hintBorder = p.green,
    warningBackground = p.neutral5,
    warningBorder = p.orange,
    warningForeground = p.orange,
  }

  cs.errorLens = {
    errorBackground = hp.blend(p.red, 0.1),
    errorForeground = p.red,
    warningBackground = hp.blend(p.orange, 0.1),
    warningForeground = p.orange,
    infoBackground = hp.blend(p.cyan, 0.1),
    infoForeground = p.cyan,
    hintBackground = hp.blend(p.green, 0.1),
    hintForeground = p.green,
  }

  cs.terminal = { background = p.neutral5, foreground = p.foreground }

  cs.terminalCursor = { background = "#ffffff", foreground = p.foreground }

  cs.editorGroupHeader = { tabsBackground = p.surface1, tabsBorder = p.surface1 }

  cs.tab = {
    activeBackground = Config.transparent_background and "NONE" or p.background,
    activeBorder = p.yellow,
    activeForeground = p.yellow,
    inactiveBackground = hp.lighten(p.background, 15),
    inactiveForeground = p.neutral2, -- "#939293",
    unfocusedActiveBackground = p.background,
    unfocusedActiveBorder = p.neutral2,
    unfocusedActiveForeground = p.neutral1, -- "#c1c0c0",
  }

  cs.statusBar = {
    background = p.surface0,
    foreground = p.neutral3,
    activeForeground = p.neutral1,
  }

  cs.diffEditor = {
    insertedLineBackground = hp.blend(p.green, 0.1, p.surface1),
    removedLineBackground = hp.blend(p.red, 0.1, p.surface1),
    modifiedLineBackground = hp.blend(p.orange, 0.1, p.surface1),
  }

  cs.diffEditorOverview = {
    insertedForeground = hp.blend(p.green, 0.65, cs.diffEditor.insertedLineBackground),
    removedForeground = hp.blend(p.red, 0.65, cs.diffEditor.removedLineBackground),
    modifiedForeground = hp.blend(p.orange, 0.65, cs.diffEditor.modifiedLineBackground),
  }

  cs.notifications = { background = p.neutral5, border = p.neutral5, foreground = p.foreground }
  cs.notificationsErrorIcon = { foreground = p.red }
  cs.notificationsInfoIcon = { foreground = p.cyan }
  cs.notificationsWarningIcon = { foreground = p.orange }

  cs.base = {
    dark = p.surface0,
    black = p.surface1,
    red = p.red,
    green = p.green,
    yellow = p.yellow,
    orange = p.orange,
    purple = p.purple,
    cyan = p.cyan,
    pink = p.pink,
    white = p.foreground,
    white_dim = p.foreground_dark,
    dimmed1 = p.neutral1,
    dimmed2 = p.neutral2,
    dimmed3 = p.neutral3,
    dimmed4 = p.neutral4,
    dimmed5 = p.neutral5,
    text = p.foreground,
  }

  cs.punctuation = {
    delimiter = {
      orange = p.delimiter_orange,
      yellow = p.delimiter_yellow,
      green = p.delimiter_green,
      cyan = p.delimiter_cyan,
      purple = p.delimiter_purple,
      pink = p.delimiter_pink,
      blue = p.delimiter_blue,
    },
  }

  cs = vim.tbl_deep_extend("force", cs, Config.overrideScheme and Config.overrideScheme(cs, p, Config, hp) or {})

  return cs
end

return M
