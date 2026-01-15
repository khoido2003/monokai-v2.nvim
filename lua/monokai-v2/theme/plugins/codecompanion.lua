local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
function M.get(c, config, hp)
	return {
		-- Chat window
		CodeCompanionChatHeader = { fg = c.base.yellow, bold = true },
		CodeCompanionChatSeparator = { fg = c.base.dimmed3 },
		CodeCompanionChatTokens = { fg = c.base.dimmed2, italic = true },
		CodeCompanionChatTool = { fg = c.base.cyan },
		CodeCompanionChatVariable = { fg = c.base.purple },
		CodeCompanionChatAgent = { fg = c.base.orange, bold = true },

		-- Virtual text
		CodeCompanionVirtualText = { fg = c.base.dimmed2, italic = true },
		CodeCompanionVirtualTextTools = { fg = c.base.cyan, italic = true },

		-- Inline assistant
		CodeCompanionInlineCode = { bg = hp.blend(c.base.cyan, 0.1, c.editor.background) },
		CodeCompanionInlineDiff = { bg = hp.blend(c.base.yellow, 0.1, c.editor.background) },

		-- Diff highlights for AI changes
		CodeCompanionDiffAdd = { link = "DiffAdd" },
		CodeCompanionDiffDelete = { link = "DiffDelete" },
		CodeCompanionDiffChange = { link = "DiffChange" },

		-- System prompts
		CodeCompanionSystemPrompt = { fg = c.base.dimmed1, italic = true },

		-- User/AI roles
		CodeCompanionUser = { fg = c.base.green, bold = true },
		CodeCompanionAssistant = { fg = c.base.purple, bold = true },
	}
end

return M
