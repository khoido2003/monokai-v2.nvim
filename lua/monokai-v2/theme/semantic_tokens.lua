local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
  local styles = config.styles

  -- Use storageclass.italic for static/abstract/virtual modifiers
  local static_italic = styles.storageclass.italic
  -- Use type.italic for type parameters
  local type_italic = styles.type.italic
  -- Use annotation.italic for decorators
  local annotation_italic = styles.annotation.italic

  -- stylua: ignore
  return {
    -- ============================================================================
    -- LSP Standard Semantic Token Types (LSP 3.17 Specification)
    -- These are the official types defined by the Language Server Protocol
    -- Reference: https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#semanticTokenTypes
    -- ============================================================================

    -- Namespaces and Modules
    ["@lsp.type.namespace"]                     = { link = "@module" },

    -- Type System
    ["@lsp.type.type"]                          = { link = "@type" },
    ["@lsp.type.class"]                         = { link = "@type" },
    ["@lsp.type.enum"]                          = { link = "@type" },
    ["@lsp.type.interface"]                     = { fg = hp.lighten(c.base.cyan, 10) },
    ["@lsp.type.struct"]                        = { link = "@type" },
    ["@lsp.type.typeParameter"]                 = { fg = c.base.cyan, italic = type_italic },

    -- Variables and Parameters
    ["@lsp.type.parameter"]                     = { link = "@variable.parameter" },
    ["@lsp.type.variable"]                      = { link = "@variable" },
    ["@lsp.type.property"]                      = { link = "@property" },
    ["@lsp.type.enumMember"]                    = { link = "@constant" },
    ["@lsp.type.event"]                         = { fg = c.base.yellow },

    -- Functions and Methods
    ["@lsp.type.function"]                      = { link = "@function" },
    ["@lsp.type.method"]                        = { link = "@function.method" },
    ["@lsp.type.macro"]                         = { link = "@function.macro" },

    -- Keywords and Language Constructs
    ["@lsp.type.keyword"]                       = { link = "@keyword" },
    ["@lsp.type.modifier"]                      = { link = "@keyword.modifier" },
    ["@lsp.type.comment"]                       = { link = "@comment" },

    -- Literals
    ["@lsp.type.string"]                        = { link = "@string" },
    ["@lsp.type.number"]                        = { link = "@number" },
    ["@lsp.type.regexp"]                        = { link = "@string.regexp" },
    ["@lsp.type.operator"]                      = { link = "@operator" },
    ["@lsp.type.constant"]                      = { link = "@constant" },

    -- ============================================================================
    -- Extended/Common Types (Used by various language servers)
    -- These are commonly used extensions beyond the standard specification
    -- ============================================================================

    -- Decorators and Attributes (Python, TypeScript, Java, C#)
    ["@lsp.type.decorator"]                     = { link = "@attribute" },
    ["@lsp.type.annotation"]                    = { link = "@attribute" },

    -- Rust-specific
    ["@lsp.type.builtinType"]                   = { link = "@type.builtin" },
    ["@lsp.type.deriveHelper"]                  = { link = "@attribute" },
    ["@lsp.type.lifetime"]                      = { link = "@keyword.storage" },
    ["@lsp.type.selfKeyword"]                   = { link = "@variable.builtin" },
    ["@lsp.type.selfTypeKeyword"]               = { link = "@variable.builtin" },
    ["@lsp.type.escapeSequence"]                = { link = "@string.escape" },
    ["@lsp.type.formatSpecifier"]               = { link = "@markup.list" },
    ["@lsp.type.generic"]                       = { link = "@variable" },
    ["@lsp.type.boolean"]                       = { link = "@boolean" },
    ["@lsp.type.typeAlias"]                     = { link = "@type.definition" },
    ["@lsp.type.unresolvedReference"]           = { undercurl = true, sp = c.base.red },

    -- C/C++ specific
    ["@lsp.type.concept"]                       = { fg = c.base.cyan, italic = type_italic },

    -- C#/Unity specific
    ["@lsp.type.delegate"]                      = { fg = c.base.cyan },
    ["@lsp.type.record"]                        = { link = "@type" },
    ["@lsp.type.recordStruct"]                  = { link = "@type" },
    ["@lsp.type.field"]                         = { link = "@variable.member" },
    ["@lsp.type.local"]                         = { link = "@variable" },
    ["@lsp.type.extensionMethod"]               = { fg = c.base.green },
    ["@lsp.type.newOperator"]                   = { link = "@keyword" },
    ["@lsp.type.stringVerbatim"]                = { link = "@string" },
    ["@lsp.type.controlKeyword"]                = { link = "@keyword.conditional" },
    ["@lsp.type.operatorOverloaded"]            = { link = "@operator" },
    ["@lsp.type.preprocessorKeyword"]           = { link = "@keyword.directive" },
    ["@lsp.type.preprocessorText"]              = { fg = c.base.dimmed2 },
    ["@lsp.type.excludedCode"]                  = { fg = c.base.dimmed3 },
    ["@lsp.type.label"]                         = { link = "@label" },

    -- Python specific
    ["@lsp.type.builtinConstant"]               = { link = "@constant.builtin" },
    ["@lsp.type.magicFunction"]                 = { fg = c.base.green, italic = static_italic },
    ["@lsp.type.module"]                        = { link = "@module" },
    ["@lsp.type.selfParameter"]                 = { link = "@variable.builtin" },
    ["@lsp.type.clsParameter"]                  = { link = "@variable.builtin" },

    -- Go specific
    ["@lsp.type.builtinFunction"]               = { link = "@function.builtin" },

    -- Java specific
    ["@lsp.type.annotationMember"]              = { link = "@attribute" },
    ["@lsp.type.importDeclaration"]             = { link = "@keyword.import" },

    -- XML/HTML documentation comments (C#, Java, etc.)
    ["@lsp.type.xmlDocCommentName"]             = { fg = c.base.dimmed2 },
    ["@lsp.type.xmlDocCommentText"]             = { fg = c.base.dimmed3 },
    ["@lsp.type.xmlDocCommentDelimiter"]        = { fg = c.base.dimmed3 },
    ["@lsp.type.xmlDocCommentAttributeName"]    = { fg = c.base.dimmed2 },
    ["@lsp.type.xmlDocCommentAttributeQuotes"]  = { fg = c.base.yellow },
    ["@lsp.type.xmlDocCommentAttributeValue"]   = { fg = c.base.yellow },
    ["@lsp.type.xmlDocCommentEntityReference"]  = { fg = c.base.purple },
    ["@lsp.type.xmlDocCommentCDataSection"]     = { fg = c.base.yellow },

    -- Regex tokens (used by many languages)
    ["@lsp.type.regexComment"]                  = { link = "@comment" },
    ["@lsp.type.regexCharacterClass"]           = { fg = c.base.cyan },
    ["@lsp.type.regexAnchor"]                   = { fg = c.base.red },
    ["@lsp.type.regexQuantifier"]               = { fg = c.base.purple },
    ["@lsp.type.regexGrouping"]                 = { fg = c.base.orange },
    ["@lsp.type.regexAlternation"]              = { fg = c.base.red },
    ["@lsp.type.regexText"]                     = { fg = c.base.yellow },
    ["@lsp.type.regexSelfEscapedCharacter"]     = { fg = c.base.purple },
    ["@lsp.type.regexOtherEscape"]              = { fg = c.base.purple },

    -- ============================================================================
    -- LSP Standard Semantic Token Modifiers
    -- Reference: https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#semanticTokenModifiers
    -- ============================================================================

    -- NOTE: Modifiers should only apply STYLE changes (italic, bold, strikethrough)
    -- NOT color changes. Color is determined by the base type.
    -- This ensures classes stay cyan, methods stay green, etc.
    ["@lsp.mod.declaration"]                    = {},  -- Just declared, no special style
    ["@lsp.mod.definition"]                     = {},  -- Where defined, no special style
    ["@lsp.mod.readonly"]                       = {},  -- Don't change color, handled by typemod
    ["@lsp.mod.static"]                         = { italic = static_italic },
    ["@lsp.mod.deprecated"]                     = { strikethrough = true },
    ["@lsp.mod.abstract"]                       = { italic = static_italic },
    ["@lsp.mod.async"]                          = { bold = true },
    ["@lsp.mod.modification"]                   = {},  -- Write access, no special style
    ["@lsp.mod.documentation"]                  = {},  -- Handled by typemod.comment.documentation
    ["@lsp.mod.defaultLibrary"]                 = {},  -- Don't change color, handled by typemod

    -- Extended modifiers (commonly used)
    ["@lsp.mod.virtual"]                        = { italic = static_italic },
    ["@lsp.mod.mutable"]                        = {},
    ["@lsp.mod.global"]                         = {},
    ["@lsp.mod.constant"]                       = {},  -- Don't change color, handled by typemod
    ["@lsp.mod.public"]                         = {},
    ["@lsp.mod.private"]                        = {},
    ["@lsp.mod.protected"]                      = {},
    ["@lsp.mod.injected"]                       = {},

    -- ============================================================================
    -- Combined Type + Modifier Highlights (typemod)
    -- These provide more specific styling when both type and modifier are known
    -- ============================================================================

    -- Classes with modifiers
    ["@lsp.typemod.class.declaration"]          = { fg = c.base.cyan },
    ["@lsp.typemod.class.defaultLibrary"]       = { fg = c.base.cyan },
    ["@lsp.typemod.class.static"]               = { fg = c.base.cyan, italic = static_italic },
    ["@lsp.typemod.class.abstract"]             = { fg = c.base.cyan, italic = static_italic },

    -- Structs with modifiers
    ["@lsp.typemod.struct.declaration"]         = { fg = c.base.cyan },
    ["@lsp.typemod.struct.defaultLibrary"]      = { fg = c.base.cyan },
    ["@lsp.typemod.struct.readonly"]            = { fg = c.base.cyan },

    -- Interfaces with modifiers
    ["@lsp.typemod.interface.declaration"]      = { fg = hp.lighten(c.base.cyan, 10) },
    ["@lsp.typemod.interface.defaultLibrary"]   = { fg = hp.lighten(c.base.cyan, 10) },

    -- Enums with modifiers
    ["@lsp.typemod.enum.declaration"]           = { fg = c.base.cyan },
    ["@lsp.typemod.enum.defaultLibrary"]        = { fg = c.base.cyan },
    ["@lsp.typemod.enumMember.declaration"]     = { fg = c.base.purple },
    ["@lsp.typemod.enumMember.defaultLibrary"]  = { fg = c.base.purple },
    ["@lsp.typemod.enumMember.readonly"]        = { fg = c.base.purple },

    -- Type with modifiers
    ["@lsp.typemod.type.declaration"]           = { fg = c.base.cyan },
    ["@lsp.typemod.type.defaultLibrary"]        = { fg = c.base.cyan },
    ["@lsp.typemod.type.readonly"]              = { link = "@type" },

    -- Variables with modifiers
    ["@lsp.typemod.variable.declaration"]       = { fg = c.base.white },
    ["@lsp.typemod.variable.readonly"]          = { fg = c.base.purple },
    ["@lsp.typemod.variable.static"]            = { fg = c.base.white, italic = static_italic },
    ["@lsp.typemod.variable.constant"]          = { fg = c.base.purple },
    ["@lsp.typemod.variable.defaultLibrary"]    = { fg = c.base.dimmed1, italic = static_italic },
    ["@lsp.typemod.variable.global"]            = { fg = c.base.white },
    ["@lsp.typemod.variable.mutable"]           = { fg = c.base.white },
    ["@lsp.typemod.variable.injected"]          = { fg = c.base.white },

    -- Fields with modifiers
    ["@lsp.typemod.field.readonly"]             = { fg = c.base.purple },
    ["@lsp.typemod.field.static"]               = { fg = c.base.white, italic = static_italic },
    ["@lsp.typemod.field.defaultLibrary"]       = { fg = c.base.dimmed1, italic = static_italic },
    ["@lsp.typemod.field.constant"]             = { fg = c.base.purple },

    -- Properties with modifiers
    ["@lsp.typemod.property.declaration"]       = { fg = c.base.white_dim },
    ["@lsp.typemod.property.readonly"]          = { fg = c.base.white_dim },
    ["@lsp.typemod.property.static"]            = { fg = c.base.white_dim, italic = static_italic },
    ["@lsp.typemod.property.defaultLibrary"]    = { fg = c.base.dimmed1, italic = static_italic },

    -- Parameters with modifiers
    ["@lsp.typemod.parameter.declaration"]      = { fg = c.base.orange },
    ["@lsp.typemod.parameter.readonly"]         = { fg = c.base.orange },
    ["@lsp.typemod.parameter.modification"]     = { fg = c.base.orange },

    -- Functions with modifiers
    ["@lsp.typemod.function.declaration"]       = { fg = c.base.green },
    ["@lsp.typemod.function.readonly"]          = { fg = c.base.green },
    ["@lsp.typemod.function.static"]            = { fg = c.base.green, italic = static_italic },
    ["@lsp.typemod.function.async"]             = { fg = c.base.green, bold = true },
    ["@lsp.typemod.function.defaultLibrary"]    = { fg = c.base.green },
    ["@lsp.typemod.function.deprecated"]        = { fg = c.base.green, strikethrough = true },
    ["@lsp.typemod.function.abstract"]          = { fg = c.base.green, italic = static_italic },

    -- Methods with modifiers
    ["@lsp.typemod.method.declaration"]         = { fg = c.base.green },
    ["@lsp.typemod.method.readonly"]            = { fg = c.base.green },
    ["@lsp.typemod.method.static"]              = { fg = c.base.green, italic = static_italic },
    ["@lsp.typemod.method.async"]               = { fg = c.base.green, bold = true },
    ["@lsp.typemod.method.defaultLibrary"]      = { fg = c.base.green },
    ["@lsp.typemod.method.deprecated"]          = { fg = c.base.green, strikethrough = true },
    ["@lsp.typemod.method.virtual"]             = { fg = c.base.green, italic = static_italic },
    ["@lsp.typemod.method.abstract"]            = { fg = c.base.green, italic = static_italic },

    -- Namespace with modifiers
    ["@lsp.typemod.namespace.declaration"]      = { fg = c.base.cyan },
    ["@lsp.typemod.namespace.defaultLibrary"]   = { fg = c.base.cyan },

    -- Macros with modifiers
    ["@lsp.typemod.macro.declaration"]          = { fg = c.base.green },
    ["@lsp.typemod.macro.defaultLibrary"]       = { fg = c.base.green },

    -- Local variables (common in some LSPs)
    ["@lsp.typemod.local.readonly"]             = { fg = c.base.purple },
    ["@lsp.typemod.local.mutable"]              = { fg = c.base.white },

    -- Events (C#, etc.)
    ["@lsp.typemod.event.declaration"]          = { fg = c.base.yellow },
    ["@lsp.typemod.event.static"]               = { fg = c.base.yellow, italic = static_italic },

    -- Delegates (C#)
    ["@lsp.typemod.delegate.declaration"]       = { fg = c.base.cyan },
    ["@lsp.typemod.delegate.static"]            = { fg = c.base.cyan, italic = static_italic },

    -- Decorators/Annotations
    ["@lsp.typemod.decorator.declaration"]      = { link = "@attribute" },
    ["@lsp.typemod.decorator.definition"]       = { link = "@attribute" },

    -- Comments
    ["@lsp.typemod.comment.documentation"]      = { link = "@comment.documentation" },

    -- Keywords
    ["@lsp.typemod.keyword.controlFlow"]        = { link = "@keyword.conditional" },
    ["@lsp.typemod.keyword.async"]              = { link = "@keyword.coroutine" },

    -- Type parameters with modifiers
    ["@lsp.typemod.typeParameter.declaration"]  = { fg = c.base.cyan, italic = type_italic },
    ["@lsp.typemod.typeParameter.definition"]   = { fg = c.base.cyan, italic = type_italic },

    -- Operator with modifiers
    ["@lsp.typemod.operator.controlFlow"]       = { link = "@keyword.conditional" },
    ["@lsp.typemod.operator.injected"]          = { link = "@operator" },

    -- String with modifiers (injected languages, etc.)
    ["@lsp.typemod.string.injected"]            = { link = "@string" },

    -- ============================================================================
    -- Fallback/Priority Rules
    -- These handle common combined modifier scenarios and ensure types keep
    -- their correct base colors even with multiple modifiers
    -- ============================================================================

    -- Classes should ALWAYS be cyan
    ["@lsp.typemod.class.readonly"]             = { fg = c.base.cyan },
    ["@lsp.typemod.class.static.readonly"]      = { fg = c.base.cyan, italic = static_italic },
    ["@lsp.typemod.class.static.abstract"]      = { fg = c.base.cyan, italic = static_italic },

    -- Structs should ALWAYS be cyan  
    ["@lsp.typemod.struct.static"]              = { fg = c.base.cyan, italic = static_italic },
    ["@lsp.typemod.struct.static.readonly"]     = { fg = c.base.cyan, italic = static_italic },

    -- Interfaces should ALWAYS be light cyan
    ["@lsp.typemod.interface.readonly"]         = { fg = hp.lighten(c.base.cyan, 10) },
    ["@lsp.typemod.interface.static"]           = { fg = hp.lighten(c.base.cyan, 10), italic = static_italic },

    -- Enums should ALWAYS be cyan
    ["@lsp.typemod.enum.readonly"]              = { fg = c.base.cyan },
    ["@lsp.typemod.enum.static"]                = { fg = c.base.cyan, italic = static_italic },

    -- Methods should ALWAYS be green
    ["@lsp.typemod.method.readonly"]            = { fg = c.base.green },
    ["@lsp.typemod.method.static.readonly"]     = { fg = c.base.green, italic = static_italic },
    ["@lsp.typemod.method.static.async"]        = { fg = c.base.green, italic = static_italic, bold = true },

    -- Functions should ALWAYS be green
    ["@lsp.typemod.function.readonly"]          = { fg = c.base.green },
    ["@lsp.typemod.function.static.readonly"]   = { fg = c.base.green, italic = static_italic },

    -- Namespaces should ALWAYS be cyan
    ["@lsp.typemod.namespace.readonly"]         = { fg = c.base.cyan },

    -- Properties should stay white_dim (not purple)
    ["@lsp.typemod.property.readonly"]          = { fg = c.base.white_dim },
    ["@lsp.typemod.property.static.readonly"]   = { fg = c.base.white_dim, italic = static_italic },

    -- Static + readonly fields/variables are constant-like (purple + italic)
    ["@lsp.typemod.field.static.readonly"]      = { fg = c.base.purple, italic = static_italic },
    ["@lsp.typemod.variable.static.readonly"]   = { fg = c.base.purple, italic = static_italic },
    ["@lsp.typemod.variable.readonly.constant"] = { fg = c.base.purple },
  }
end

return M
