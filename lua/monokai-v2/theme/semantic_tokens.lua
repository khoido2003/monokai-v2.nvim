local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
  -- stylua: ignore
  return {
    ["@lsp.type.boolean"]                       = { link = "@boolean" },
    ["@lsp.type.builtinType"]                   = { link = "@type.builtin" },
    ["@lsp.type.class"]                         = { link = "@type" },
    ["@lsp.type.comment"]                       = { link = "@comment" },
    ["@lsp.type.decorator"]                     = { link = "@attribute" },
    ["@lsp.type.deriveHelper"]                  = { link = "@attribute" },
    ["@lsp.type.enum"]                          = { link = "@type" },
    ["@lsp.type.enumMember"]                    = { link = "@constant" },
    ["@lsp.type.escapeSequence"]                = { link = "@string.escape" },
    ["@lsp.type.formatSpecifier"]               = { link = "@markup.list" },
    ["@lsp.type.generic"]                       = { link = "@variable" },
    ["@lsp.type.interface"]                     = { fg = hp.lighten(c.base.cyan, 10) },
    ["@lsp.type.keyword"]                       = { link = "@keyword" },
    ["@lsp.type.lifetime"]                      = { link = "@keyword.storage" },
    ["@lsp.type.namespace"]                     = { link = "@module" },
    ["@lsp.type.number"]                        = { link = "@number" },
    ["@lsp.type.operator"]                      = { link = "@operator" },
    ["@lsp.type.parameter"]                     = { link = "@variable.parameter" },
    ["@lsp.type.property"]                      = { link = "@property" },
    ["@lsp.type.selfKeyword"]                   = { link = "@variable.builtin" },
    ["@lsp.type.selfTypeKeyword"]               = { link = "@variable.builtin" },
    ["@lsp.type.string"]                        = { link = "@string" },
    ["@lsp.type.type"]                          = { link = "@type" },
    ["@lsp.type.typeAlias"]                     = { link = "@type.definition" },
    ["@lsp.type.unresolvedReference"]           = { undercurl = true, sp = c.base.red },
    ["@lsp.type.variable"]                      = { link = "@variable" },
    ["@lsp.type.method"]                        = { link = "@function.method" },
    ["@lsp.type.function"]                      = { link = "@function" },
    ["@lsp.type.macro"]                         = { link = "@function.macro" },
    
    -- Modifiers
    ["@lsp.mod.documentation"]                  = { link = "@comment.documentation" },
    ["@lsp.mod.notification"]                   = { bold = true },
    ["@lsp.mod.deprecated"]                     = { strikethrough = true },
    ["@lsp.mod.defaultLibrary"]                 = { link = "@variable.builtin" },
    ["@lsp.mod.static"]                         = { link = "@constant" },
  }
end

return M
