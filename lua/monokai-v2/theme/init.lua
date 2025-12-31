local Helper = require("monokai-v2.color_helper")
local Util = require("monokai-v2.util")
local Config = require("monokai-v2.config")
local Colorscheme = require("monokai-v2.colorscheme")

---@class monokaiv2Theme
---@field mini monokai-v2.theme.plugins.mini
local M = {}

setmetatable(M, {
  __index = function(_, k)
    local plugin = require("monokai-v2.theme.plugins." .. k)
    return plugin
  end,
})

---@enum SupportedPlugins
local PLUGINS = {
  "mini",
  "aerial",
  "alpha",
  "beacon",
  "barbar",
  "blink",
  "grug_far",
  "render_markdown",
  "oil",
  "avante",
  "breadcrumb",
  "bufferline",
  "cmp",
  "coc",
  "dashboard",
  "fidget",
  "fzf-lua",
  "gitsign",
  "illuminate",
  "indent_blankline",
  "lazy",
  "lsp",
  "mason",
  "neo-tree",
  "noice",
  "notify",
  "nvim-navic",
  "nvim-tree",
  "nvim-treesitter",
  "nvim-ts-rainbow2",
  "packer",
  "rainbow-delimiters",
  "renamer",
  "scrollbar",
  "snacks",
  "telescope",
  "toggleterm",
  "ufo",
  "which-key",
  "wilder",

  "symbols_outline",
  "neogit",
  "zen_mode",
  "leap",
  "flash",
  "nvim_surround",
  "nvim_autopairs",
  "vim_matchup",
  "dap",
  "lspsaga",
  "trouble",

  "dapui",
  "diffview",
  "dropbar",
  "git_conflict",
  "glow",
  "harpoon",
  "hlslens",
  "incline",
  "lazygit",
  "marks",
  "neorg",
  "neotest",
  "octo",
  "overseer",
  "rest",
  "spectre",
  "todo-comments",
  "yanky",
  "outline",
}

-- Get highlight group dictionary
-- Example:
-- local hl_groups = {
--   Normal = { bg = c.editor.background, fg = c.editor.foreground, }, -- normal text
--   ["@modifier"] = { fg = c.base.red, italic = true },
-- }
---@param colorscheme Colorscheme
---@return HighlightGroupTbl
local function get_hl_group_tbl(colorscheme)
  local editor = require("monokai-v2.theme.editor").setup(colorscheme, Config, Helper)
  local syntax = require("monokai-v2.theme.syntax").setup(colorscheme, Config, Helper)
  local semantic_tokens = require("monokai-v2.theme.semantic_tokens").setup(colorscheme, Config, Helper)
  local extra = require("monokai-v2.theme.extra").setup(colorscheme, Config, Helper)
  --  The HlGroups class represents a collection of highlighter groups.
  --  Each group is identified by a string key (e.g. "editor") and holds the result of calling the `setup` function of a corresponding highlighter module (e.g. `editor.setup`).
  --  The class has a single field, `hl_groups`, which is a table containing the highlighter groups.
  --- @type HighlightGroupTbl
  local hl_group_tbl = {}
  hl_group_tbl = vim.tbl_deep_extend("force", hl_group_tbl, editor, syntax, semantic_tokens, extra)
  for _, name in ipairs(PLUGINS) do
    local ok, plugin = pcall(require, "monokai-v2.theme.plugins." .. name)
    if ok and plugin and plugin.get then
      hl_group_tbl = vim.tbl_deep_extend("force", hl_group_tbl, plugin.get(colorscheme, Config, Helper))
    end
  end
  hl_group_tbl = vim.tbl_deep_extend("force", hl_group_tbl, Config.override and Config.override(colorscheme) or {})
  return hl_group_tbl
end

---@return HighlightGroupTbl
M.setup = function()
  local devicons = require("monokai-v2.devicons")

  local colorscheme = Colorscheme(Config.filter)
  -- print(colorscheme.editor.background)
  -- print(colorscheme.tab.activeBackground)
  local hl_group_tbl = get_hl_group_tbl(colorscheme)
  -- print(Helper.lighten(colorscheme.tab.activeBackground, 10))
  -- M.temp = vim.tbl_deep_extend("force", colorscheme.tab or {}, true and {
  --   activeBackground = Helper.lighten(colorscheme.tab.activeBackground, 10),
  --   inactiveBackground = Helper.lighten(colorscheme.tab.inactiveBackground, 10),
  --   unfocusedActiveBackground = Helper.lighten(colorscheme.tab.unfocusedActiveBackground, 10),
  -- } or {})
  -- print(vim.inspect(M.temp))

  if Config.terminal_colors then
    Util.extra.terminal(Colorscheme)
  end

  if Config.devicons then
    devicons.setup(Colorscheme)
  end

  return hl_group_tbl
end

return M
