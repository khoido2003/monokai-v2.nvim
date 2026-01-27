local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
  return {
    -- Severity-based highlights
    TinyInlineDiagnosticVirtualTextError = {
      fg = c.inputValidation.errorForeground,
      bg = hp.blend(c.inputValidation.errorForeground, 0.1, c.editor.background),
    },
    TinyInlineDiagnosticVirtualTextWarn = {
      fg = c.inputValidation.warningForeground,
      bg = hp.blend(c.inputValidation.warningForeground, 0.1, c.editor.background),
    },
    TinyInlineDiagnosticVirtualTextInfo = {
      fg = c.inputValidation.infoForeground,
      bg = hp.blend(c.inputValidation.infoForeground, 0.1, c.editor.background),
    },
    TinyInlineDiagnosticVirtualTextHint = {
      fg = c.inputValidation.hintForeground,
      bg = hp.blend(c.inputValidation.hintForeground, 0.1, c.editor.background),
    },

    -- Arrow/pointer highlights
    TinyInlineDiagnosticVirtualTextArrow = { fg = c.base.dimmed3 },

    -- Inverted (for some presets)
    TinyInlineInvDiagnosticVirtualTextError = {
      fg = c.editor.background,
      bg = c.inputValidation.errorForeground,
    },
    TinyInlineInvDiagnosticVirtualTextWarn = {
      fg = c.editor.background,
      bg = c.inputValidation.warningForeground,
    },
    TinyInlineInvDiagnosticVirtualTextInfo = {
      fg = c.editor.background,
      bg = c.inputValidation.infoForeground,
    },
    TinyInlineInvDiagnosticVirtualTextHint = {
      fg = c.editor.background,
      bg = c.inputValidation.hintForeground,
    },
  }
end

return M
