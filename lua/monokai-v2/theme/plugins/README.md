# Plugin Support

This directory contains theme configurations for various Neovim plugins. Each file defines how the Monokai V2 colorscheme integrates with specific plugins.

## Supported Plugins

### UI & Navigation
- **alpha-nvim** - Startup screen
- **bufferline.nvim** - Tab/buffer line
- **dashboard-nvim** - Dashboard
- **neo-tree.nvim** - File explorer
- **nvim-tree.lua** - File explorer
- **telescope.nvim** - Fuzzy finder
- **which-key.nvim** - Key binding helper

### Completion & LSP
- **cmp** - Completion menu
- **blink.nvim** - Enhanced completion
- **coc.nvim** - Language server
- **lsp** - Language server protocol
- **mason.nvim** - LSP installer
- **nvim-navic** - Breadcrumbs
- **aerial.nvim** - Code outline

### Git & Version Control
- **gitsigns.nvim** - Git signs in gutter
- **diffview.nvim** - Git diff viewer

### Syntax & Highlighting
- **nvim-treesitter** - Syntax highlighting
- **indent-blankline.nvim** - Indent guides
- **rainbow-delimiters.nvim** - Rainbow parentheses
- **nvim-ts-rainbow2** - Rainbow parentheses (alternative)
- **illuminate** - Word highlighting

### Terminal & UI Elements
- **toggleterm.nvim** - Terminal
- **notify.nvim** - Notifications
- **noice.nvim** - UI improvements
- **scrollbar.nvim** - Scrollbar
- **ufo.nvim** - Folding
- **beacon.nvim** - Cursor highlighting

### Package Managers
- **lazy.nvim** - Plugin manager
- **packer.nvim** - Plugin manager

### Utilities
- **fidget.nvim** - LSP progress
- **fzf-lua** - Fuzzy finder
- **mini.nvim** - Mini plugins
- **renamer.nvim** - File renaming
- **snacks.nvim** - Quick actions
- **wilder.nvim** - Command line completion

### Statuslines
- **lualine.nvim** - Statusline
- **lightline.vim** - Statusline
- **barbecue.nvim** - Breadcrumbs

## Development Guidelines

### Color Usage
- Use `c.base.*` colors for consistent theming
- Use `c.editor.*` colors for editor-specific elements
- Use `c.syntax.*` colors for syntax highlighting
- Use `c.plugin.*` colors for plugin-specific elements

### Best Practices
1. **Consistency**: Maintain consistent styling across similar elements
2. **Contrast**: Ensure adequate contrast for readability
3. **Moderation**: Use bright colors sparingly to avoid visual fatigue
4. **Accessibility**: Consider color-blind users when choosing color combinations

### Adding New Plugins
1. Create a new `.lua` file in this directory
2. Follow the existing naming convention
3. Use the standard function signature: `function M.get(c, config, hp)`
4. Return a table of highlight group definitions
5. Test with the actual plugin to ensure proper integration

