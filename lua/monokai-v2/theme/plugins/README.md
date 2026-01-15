# Plugin Support

This directory contains theme configurations for various Neovim plugins.  
Each file defines how the **Monokai V2** colorscheme integrates with specific plugins.

---

## Supported Plugins

### 🖥️ UI & Navigation
- **alpha-nvim** – Startup screen  
- **dashboard-nvim** – Dashboard  
- **bufferline.nvim** – Tab/buffer line  
- **neo-tree.nvim** – File explorer  
- **nvim-tree.lua** – File explorer  
- **telescope.nvim** – Fuzzy finder  
- **fzf-lua** – Fuzzy finder (Lua version)  
- **which-key.nvim** – Key binding helper  
- **aerial.nvim** – Code outline  
- **symbols-outline.nvim** – Symbol outline  
- **dropbar.nvim** – Breadcrumb / winbar  
- **breadcrumb.nvim** – Lightweight breadcrumbs  
- **outline.nvim** – Alternative code outline  

---

### ⚡ Completion & LSP
- **nvim-cmp** – Completion menu  
- **blink.nvim** – Enhanced completion  
- **coc.nvim** – Language server client  
- **nvim-lspconfig** – Language Server Protocol  
- **lspsaga.nvim** – LSP UI enhancements  
- **trouble.nvim** – Diagnostics & quickfix list  
- **mason.nvim** – LSP/DAP installer  
- **nvim-navic** – Breadcrumbs  
- **tiny-inline-diagnostic.nvim** – Inline diagnostic messages  

---

### 🔍 Syntax & Highlighting
- **nvim-treesitter** – Syntax highlighting  
- **indent-blankline.nvim** – Indent guides  
- **rainbow-delimiters.nvim** – Rainbow parentheses  
- **nvim-ts-rainbow2** – Rainbow parentheses (alternative)  
- **vim-illuminate** – Word highlighting  
- **vim-matchup** – Enhanced `%` motions  

---

### 🌳 Git & Version Control
- **gitsigns.nvim** – Git signs in gutter  
- **diffview.nvim** – Git diff viewer  
- **git-conflict.nvim** – Conflict resolution  
- **neogit** – Magit-style Git UI  
- **lazygit.nvim** – LazyGit integration  
- **octo.nvim** – GitHub issues/PRs  

---

### 🧪 Debugging & Testing
- **nvim-dap** – Debug adapter protocol  
- **nvim-dap-ui** – UI for nvim-dap  
- **neotest** – Testing framework  

---

### 🛠️ Editing & Productivity
- **mini.nvim** – Mini collection  
- **nvim-surround** – Surround text  
- **nvim-autopairs** – Auto-close pairs  
- **leap.nvim** – Motion plugin  
- **flash.nvim** – Motion plugin  
- **harpoon** – Quick file navigation  
- **marks.nvim** – Mark management  
- **yanky.nvim** – Yank history  
- **renamer.nvim** – File renaming  
- **snacks.nvim** – Quick actions  
- **todo-comments.nvim** – TODO highlights  
- **rest.nvim** – REST client  
- **overseer.nvim** – Task runner  
- **spectre.nvim** – Search & replace  
- **codecompanion.nvim** – AI coding assistant  

---

### 🖼️ Terminal & UI Elements
- **toggleterm.nvim** – Integrated terminal  
- **notify.nvim** – Notifications  
- **noice.nvim** – UI improvements  
- **scrollbar.nvim** – Scrollbar  
- **ufo.nvim** – Folding  
- **incline.nvim** – Floating winbar  
- **beacon.nvim** – Cursor highlight  
- **fidget.nvim** – LSP progress  
- **glow.nvim** – Markdown preview  
- **zen-mode.nvim** – Distraction-free editing  

---

### 📦 Package Managers
- **lazy.nvim** – Plugin manager  
- **packer.nvim** – Plugin manager  

---

## 🎨 Development Guidelines

### Color Usage
- Use `c.base.*` colors for consistent theming  
- Use `c.editor.*` colors for editor-specific elements  
- Use `c.syntax.*` colors for syntax highlighting  
- Use `c.plugin.*` colors for plugin-specific elements  

### Best Practices
1. **Consistency** – Maintain consistent styling across similar elements  
2. **Contrast** – Ensure adequate contrast for readability  
3. **Moderation** – Use bright colors sparingly to avoid visual fatigue  
4. **Accessibility** – Consider color-blind users when choosing color combinations  

### Adding New Plugins
1. Create a new `.lua` file in this directory  
2. Follow the existing naming convention  
3. Use the standard function signature:  

   ```lua
   function M.get(c, config, hp)
     return {
       PluginHighlightGroup = { fg = c.base.red, bg = c.editor.background },
     }
   end
   ```

4. Return a table of highlight group definitions
5. Test with the actual plugin to ensure proper integration
