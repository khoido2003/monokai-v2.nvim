local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
function M.get(c, config, _)
  local styles = config.styles
  local treesitter_options = config.treesitter

  -- Neovim 0.10+ standard captures
  -- See :help treesitter-highlight-groups
  local spec = {
    -- Identifiers
    ["@variable"] = { fg = c.base.white },
    ["@variable.builtin"] = { fg = c.base.dimmed1, italic = treesitter_options.italic },
    ["@variable.parameter"] = { fg = c.base.orange, italic = treesitter_options.italic },
    ["@variable.member"] = { fg = c.base.white }, -- Fields

    ["@constant"] = { fg = c.base.purple },
    ["@constant.builtin"] = { fg = c.base.purple },
    ["@constant.macro"] = { fg = c.base.purple },

    ["@module"] = { fg = c.base.cyan },
    ["@module.builtin"] = { fg = c.base.cyan },
    ["@label"] = { fg = c.base.cyan },

    -- Literals
    ["@string"] = { fg = c.base.yellow },
    ["@string.documentation"] = { fg = c.base.dimmed3 },
    ["@string.regexp"] = { fg = c.base.yellow },
    ["@string.escape"] = { fg = c.base.purple },
    ["@string.special"] = { fg = c.base.purple },

    ["@character"] = { fg = c.base.purple },
    ["@character.special"] = { fg = c.base.purple },

    ["@boolean"] = { fg = c.base.purple },
    ["@number"] = { fg = c.base.purple },
    ["@number.float"] = { fg = c.base.purple },

    -- Types
    ["@type"] = { fg = c.base.cyan, italic = styles.type.italic },
    ["@type.builtin"] = { fg = c.base.cyan, italic = styles.type.italic },
    ["@type.definition"] = { fg = c.base.cyan, italic = styles.type.italic },
    ["@attribute"] = { fg = c.base.cyan },
    ["@property"] = { fg = c.base.white_dim },

    -- Functions
    ["@function"] = { fg = c.base.green },
    ["@function.builtin"] = { fg = c.base.green },
    ["@function.call"] = { fg = c.base.green },
    ["@function.macro"] = { fg = c.base.green },
    ["@function.method"] = { fg = c.base.green },
    ["@function.method.call"] = { fg = c.base.green },
    ["@constructor"] = { fg = c.base.green },
    ["@operator"] = { fg = c.base.red },

    -- Keywords
    ["@keyword"] = { fg = c.base.red, italic = styles.keyword.italic },
    ["@keyword.coroutine"] = { fg = c.base.red, italic = styles.keyword.italic },
    ["@keyword.function"] = { fg = c.base.cyan, italic = styles.keyword.italic },
    ["@keyword.operator"] = { fg = c.base.red },
    ["@keyword.import"] = { fg = c.base.red },
    ["@keyword.type"] = { fg = c.base.cyan, italic = styles.type.italic },
    ["@keyword.modifier"] = { fg = c.base.red },
    ["@keyword.repeat"] = { fg = c.base.red },
    ["@keyword.return"] = { fg = c.base.red },
    ["@keyword.debug"] = { fg = c.base.red },
    ["@keyword.exception"] = { fg = c.base.red },
    ["@keyword.conditional"] = { fg = c.base.red },
    ["@keyword.directive"] = { fg = c.base.red },
    ["@keyword.directive.define"] = { fg = c.base.red },

    -- Punctuation
    ["@punctuation.delimiter"] = { fg = c.base.dimmed2 },
    ["@punctuation.bracket"] = { fg = c.base.dimmed2 },
    ["@punctuation.special"] = { fg = c.base.dimmed2 },

    -- Comments
    ["@comment"] = { fg = c.base.dimmed3, italic = styles.comment.italic },
    ["@comment.documentation"] = { fg = c.base.dimmed3 },
    ["@comment.error"] = { fg = c.base.red },
    ["@comment.warning"] = { fg = c.base.orange },
    ["@comment.todo"] = { fg = c.base.purple, bold = true },
    ["@comment.note"] = { fg = c.base.cyan, bold = true },

    -- Markup
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.heading"] = { fg = c.base.yellow, bold = true },
    ["@markup.quote"] = { fg = c.base.dimmed3 },
    ["@markup.math"] = { fg = c.base.yellow },
    ["@markup.environment"] = { fg = c.base.purple },
    ["@markup.link"] = { fg = c.base.orange },
    ["@markup.link.label"] = { fg = c.base.orange },
    ["@markup.link.url"] = { fg = c.base.cyan, underline = true },
    ["@markup.raw"] = { fg = c.base.yellow },
    ["@markup.list"] = { fg = c.base.red },
    ["@markup.list.checked"] = { fg = c.base.green },
    ["@markup.list.unchecked"] = { fg = c.base.dimmed3 },

    ["@diff.plus"] = { fg = c.base.green },
    ["@diff.minus"] = { fg = c.base.red },
    ["@diff.delta"] = { fg = c.base.yellow },

    ["@tag"] = { fg = c.base.red },
    ["@tag.attribute"] = { fg = c.base.cyan, italic = treesitter_options.italic },
    ["@tag.delimiter"] = { fg = c.base.dimmed2 },
  }

  return spec
end

return M
