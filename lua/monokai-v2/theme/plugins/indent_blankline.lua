local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
function M.get(c, config, _)
  -- pro | default
  local isContextPro = config.plugins.indent_blankline.context_highlight == "pro"
  local isContextStartUnderline = config.plugins.indent_blankline.context_start_underline
  return {
    ["@ibl.indent.char.1"] = { fg = c.base.red },
    ["@ibl.indent.char.2"] = { fg = c.base.orange },
    ["@ibl.indent.char.3"] = { fg = c.base.yellow },
    ["@ibl.indent.char.4"] = { fg = c.base.green },
    ["@ibl.indent.char.5"] = { fg = c.base.cyan },
    ["@ibl.indent.char.6"] = { fg = c.base.purple },
    ["@ibl.indent.char.7"] = { fg = c.base.red },
    ["@ibl.whitespace"] = { fg = c.editor.background },
    ["@ibl.scope.char"] = isContextPro and { fg = c.base.orange } or {
      fg = c.editorIndentGuide.activeBackground,
    },
    ["@ibl.scope.underline"] = {
      sp = isContextPro and c.base.orange or c.editorIndentGuide.activeBackground,
      underline = isContextStartUnderline,
    },
    IblIndent = { fg = c.editorIndentGuide.background },
    IblScope = isContextPro and { fg = c.base.orange } or { fg = c.editorIndentGuide.activeBackground },
  }
end

return M
