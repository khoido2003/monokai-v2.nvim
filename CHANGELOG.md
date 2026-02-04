# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.11] - 2026-02-05

### Changed

- **fzf-lua**: Major styling overhaul to match Telescope's aesthetic.
  - Implemented cohesive border, background, and cursor matching `Telescope` theme.
  - Improved visibility: Selected items are now bright white, and active buffer paths are highlighted in yellow.
  - Fixed visual bugs: Removed white block artifacts in search preview.
  - Added `fzf_colors` support: Now uses theme highlights for precise color control of matches and paths.

## [0.2.10] - 2026-02-04

### Fixes

- **blink-cmp**: Fixed invisible borders on documentation and signature help windows by updating highlight groups to consistently use `c.editorSuggestWidget.background` and ensuring `FloatBorder` has a visible foreground color.
- **Floating Windows**: Fixed invisible `FloatBorder` in standard floating windows (LSP hover, diagnostics) by ensuring it has a visible foreground color (`c.base.dimmed1`) even when opaque.
- **Snacks Explorer**: Fixed persistent background color on folder icons in the explorer (which looked bad when the line was selected) by removing the hardcoded `bg` from the global `Directory` highlight group.
- **Snacks Picker**: Fixed mismatched background on line numbers, fold columns, and sign columns in the picker by removing hardcoded backgrounds from global `LineNr`, `SignColumn`, and `FoldColumn` groups (making them transparent).

### Refactoring

- **snacks.lua**: Massively refactored and slimmed down configuration.
  - Removed hundreds of redundant highlight definitions by utilizing `link` to base groups.
  - Consolidating duplicate background color logic.
  - Added missing highlight groups for GitHub picker and detailed cursor line styling.
  - Added new `SnacksExplorerCursorLine*` groups to ensure icons and text properly inherit selection backgrounds.

### Performance

- **Startup Time**: Reduced startup overhead by deferring `nvim-web-devicons` initialization using `vim.schedule`. This prevents the icon setup from blocking the critical path during colorscheme loading.

## [0.2.9] - 2026-01-27

### Refactor
- **Plugin Naming**: Renamed 12 plugin support files to match their official repository names for consistency:
  - `gitsign` -> `gitsigns`
  - `blink` -> `blink-cmp`
  - `cmp` -> `nvim-cmp`
  - `indent_blankline` -> `indent-blankline`
  - `vim_matchup` -> `vim-matchup`
  - `nvim_surround` -> `nvim-surround`
  - `nvim_autopairs` -> `nvim-autopairs`
  - `git_conflict` -> `git-conflict`
  - `zen_mode` -> `zen-mode`
  - `grug_far` -> `grug-far`
  - `tiny_inline_diagnostic` -> `tiny-inline-diagnostic`
  - `render_markdown` -> `render-markdown`

### Fixed
- **Memory Leak**: Added cleanup for debounce timers in `autocmds.lua` when buffers are deleted.
- **Devicons**: Fixed crash/bug where `dimmed` color key was missing (replaced with `dimmed2`).
- **Syntax**: Removed duplicate `FloatBorder`, `NormalFloat` highlights that conflicted with editor theme.
- **Palette**: Cleaned up unused keys (`panel`, `light`) from the light palette.
- **Code Quality**: Removed unused legacy `class.lua` utility.

## [0.2.4] - 2026-01-16

### Added
- **Expanded Devicons Support**: ~200 file type icons with Monokai colors
  - Languages: Rust, Ruby, PHP, Kotlin, Scala, Swift, Dart, Haskell, Elixir, Zig, Nim, Odin, Gleam, Julia, Crystal
  - Web: Vue, Svelte, Astro, TSX, SCSS/SASS, Less, GraphQL, Prisma
  - Shell: PowerShell, Fish, Zsh
  - Game Dev: GDScript, Godot scenes, Unity
  - Shaders: GLSL, HLSL, WGSL
  - DevOps: Docker, Terraform, Nix
  - Media: Images, Audio, Video formats
  - Documents: PDF, Word, Excel, PowerPoint
  - Archives: ZIP, TAR, GZ, RAR, 7Z
  - 3D/CAD: OBJ, STL, FBX, GLTF, Blender
- **Devicons Fallback System**: Uses Unicode escape sequences for reliable icon encoding. Falls back to built-in icons if nvim-web-devicons isn't available.
- **New Base Colors**: Added `pink` and `text` to the base colorscheme.
- **Unique Pink Per Variant**: Each filter now has its own distinct pink color:
  - Pro: `#ff6ac1`, Classic: `#ff79c6`, Machine: `#ff6d9c`
  - Spectrum: `#ff6ac1`, Octagon: `#da70d6`, Ristretto: `#ff7eb6`, Light: `#d63384`
- **Plugin Support**: Added highlight support for:
  - **tiny-inline-diagnostic.nvim** – Inline diagnostic messages with severity colors
  - **codecompanion.nvim** – AI coding assistant (chat, inline code, diffs)

### Changed
- **Devicons Default**: `devicons = true` is now the default (was `false`).
- **README**: Added "Optional Dependencies" section explaining nvim-web-devicons integration.

### Fixed
- **theme/init.lua**: Fixed bug passing `Colorscheme` module instead of `colorscheme` instance to devicons.
- **snacks.lua**: Fixed typo `SnacksPickerGitStatusIngnored` → `SnacksPickerGitStatusIgnored`.
- **trouble.lua**: Fixed invalid color reference `c.base.surface0` → `c.base.dark`.

## [0.2.3] - 2026-01-15

### Added
- **Plugin Support**: Added native highlight support for:
  - **GitHub Copilot** (`copilot.lua` / `copilot-cmp`): Ghost text and annotations.
  - **LSP Signature** (`lsp_signature.nvim`): Active parameter and hints.

### Fixed
- **LSP Semantic Tokens**: Fixed issue where custom types/classes (especially in Unity/C# projects with Roslyn) would lose highlighting or not update immediately.
  - Implemented smart event-driven refresh using `LspProgress` to detect when full project indexing completes.
  - Added debounced `BufEnter` refresh to ensure colors are correct when switching files.
  - Fixed a bug where autocmds were incorrectly gated behind the `day_night` config option, preventing them from loading for most users.
- **Commands**: Added `:MonokaiRefreshTokens` command to manually force a semantic token refresh if needed.

## [0.2.2] - 2026-01-06
- **LSP Semantic Tokens**: Add mising LSP semantic token highlighting definitions for standard types, extended language-specific types, and modifiers.

## [0.2.1] - 2025-12-31

### Added
- **Comprehensive LSP Semantic Token Support**: Complete rewrite with 130+ token definitions.
  - All 22 standard LSP types (class, struct, interface, enum, function, method, etc.)
  - All 10 standard LSP modifiers (static, readonly, deprecated, async, abstract, etc.)
  - Language-specific extensions for Rust, Python, Go, Java, C#/Unity, C++, TypeScript
  - Combined type+modifier highlights (60+ typemod combinations)
- Semantic tokens now respect `config.styles.storageclass.italic` for static/abstract/virtual modifiers
- Added missing `"light"` filter to type definitions

### Fixed
- **Memory Leak**: Timer in `autocmds.lua` now properly stops and closes when switching colorschemes
- **Config Merge Bug**: Fixed `config.extend()` merge logic that was incorrectly combining config and options
- **Require Path Bug**: Fixed missing dot in plugin require path in `theme/init.lua`
- **Operator Color**: Fixed `operatorOverloaded` being green instead of red (now links to `@operator`)
- **Static/Readonly Colors**: Static classes/methods now correctly retain cyan/green colors with italic, instead of turning purple
- Removed duplicate doc comments in `util/theme.lua`

### Changed
- Modifiers (`@lsp.mod.*`) now only apply style changes (italic, bold, strikethrough), not color overrides
- This ensures base type colors are preserved (classes stay cyan, methods stay green)

## [0.2.0] - 2025-12-31

### Added
- **Performance Compilation System**: The theme now compiles resolved highlights into a static Lua file on first load.
  - Reduces startup time to **~2-3ms**.
  - Automatically invalidates cache on config changes or neovim upgrades.
  - New command `:MonokaiCompile` to manually force compilation.
  - New command `:MonokaiClear` to clear the cache.
- **New Plugin Support**:
  - `barbar.nvim`: Full tabline support.
  - `grug-far.nvim`: Search/replace UI support.
  - `render-markdown.nvim`: Headlines, code blocks, tables, and callouts.
  - `oil.nvim`: Custom directory, socket, and operation highlights.
  - `avante.nvim`: AI Chat interface support.

### Changed
- **Architecture**: Refactored codebase to use lazy loading for non-critical modules (`util.theme`, `color_helper`), significantly reducing startup overhead.
- **Indent Blankline**: Updated to **v3** standards (`@ibl.*`) with rainbow support.
- **Trouble.nvim**: Updated to **v3** highlight standards.
- **Snacks.nvim**: Extended support for Notifier, Input, Picker, and Scratch components.
- **Mini.nvim**: Extended support for `mini.files`, `mini.pick`, `mini.clue`, `mini.hipatterns`, `mini.starter`, `mini.cursorword`, and `mini.surround`.
- **Neovim 0.11+ Compatibility**: Replaced deprecated `vim.loop` with `vim.uv`.

### Fixed
- **Cache Naming**: Fixed a bug where `config.lua` serialization failed, ensuring correct cache file names for different filters.

## [0.1.5] - 2025-09-01

### Added
- Extended **plugin support** with new integrations:
  - **UI & Navigation**: `symbols-outline.nvim`, `dropbar.nvim`, `breadcrumb.nvim`, `outline.nvim`
  - **Completion & LSP**: `lspsaga.nvim`, `trouble.nvim`
  - **Syntax & Highlighting**: `vim-matchup`
  - **Git & Version Control**: `git-conflict.nvim`, `neogit`, `lazygit.nvim`, `octo.nvim`
  - **Debugging & Testing**: `nvim-dap`, `nvim-dap-ui`, `neotest`
  - **Editing & Productivity**: `nvim-surround`, `nvim-autopairs`, `leap.nvim`, `flash.nvim`, `harpoon`, `marks.nvim`, `yanky.nvim`, `todo-comments.nvim`, `rest.nvim`, `overseer.nvim`, `spectre.nvim`
  - **UI Elements**: `incline.nvim`, `glow.nvim`, `zen-mode.nvim`

### Changed
- Documentation in **Plugin Support** updated with a categorized and expanded list of supported plugins.

### Fixed
- None


## [0.1.4] - 2025-08-31

### Added
- Enhanced **Treesitter syntax highlighting** with more precise captures. 
- Updated **README** to include a detailed “Differences from original Monokai Pro” section.
- Added a **gallery section** showcasing main filter variants (`classic`, `pro`, `machine`, `octagon`, `spectrum`) with example C# / Unity screenshots.

### Changed
- Treesitter integration improved to **respect LSP semantic token rules** more accurately.
- Updated README examples and documentation for better clarity and usage guidance.
- Minor adjustments to highlight groups to better align with Monokai V2 aesthetic.

### Fixed
- Corrected minor inconsistencies in Treesitter group mappings.
- README formatting issues fixed for gallery and configuration sections.

## [0.1.3] - 2025-08-31

### Changed
- Light mode neutral colors updated to be darker for better visibility (`neutral1–5` adjusted).  
- `neutral2` specifically darkened for improved contrast.  
- `surface0` lightened slightly for better balance with panels and UI.  
- Inactive `lualine` elements updated to use green foreground.  
- Floating window backgrounds (`FloatBorder`, diagnostic floats) updated to a darker shade for clarity.  
- Diagnostics floating window backgrounds aligned with border background for consistency.  

### Fixed
- Minor visual inconsistencies in floating windows and diagnostic highlights corrected.  
- Colors for borders, diagnostics, and floating windows adjusted for improved clarity and readability.

## [0.1.2] - 2025-08-30

### Changed
- **Blink.nvim:** Made selection line text darker for better visibility.
- **Blink.nvim:** Adjusted selection line intensity for improved readability.
- **Telescope:** Updated background to distinguish Telescope panel from main background.
- **General Colors:** Darkened `surface1` for enhanced contrast and readability in various UI elements.

### Fixed
- Minor visual inconsistencies in sidebar and selection highlights.
- Wrong date in docs

## [0.1.1] - 2025-08-30

### Added
- Custom `NvimTreeGitNewIcon`, `NvimTreeGitFileNewHL`, and `NvimTreeGitFolderNewHL` highlights for better visibility of new/untracked files
- Git highlight refinements for NvimTree (new, staged, dirty, deleted, ignored, renamed, merge) to better match Monokai Pro palette
- Documentation notes on customizing sidebar (`NvimTree`) colors

### Changed
- Adjusted `surface0` and `surface1` values to ensure they are darker than `background` for improved contrast in statuslines (e.g., lualine)
- Refined `neutral3` to match Monokai Pro’s exact comment color across all variants
- Improved consistency of delimiter colors with official Monokai Pro variants
- Fine-tuned sidebar foreground and cursor line highlights for better readability

### Fixed
- Fixed missing highlight for newly added files in NvimTree (star icon now displays in green as intended)
- Corrected mismatched background logic for sidebar when using `background_clear`

## [0.1.0] - 2025-08-29

### Added
- Initial fork of loctvl842/monokai-pro.nvim
- Improved color variable names for better readability (e.g., `red`, `orange`, `purple` instead of `accent1`, `accent2`, `accent6`)
- Enhanced plugin support with 10+ additional plugins
- Better completion experience with improved Blink.nvim integration
- Custom delimiter colors for rainbow-delimiters.nvim
- Modern default settings for better out-of-the-box experience
- Refined color palette with cleaner mappings and improved contrast
- CI/CD workflow with Stylua checks
- Automated release workflow with release-please
- Dependabot configuration for dependency updates

### Changed
- Renamed project from monokai-pro to monokai-v2
- Updated all internal references and file names
- Improved command names: `MonokaiThemeSelect` and `MonokaiChoose`
- Updated default configuration values for better usability
- Enhanced documentation with comprehensive README and help files

### Fixed
- Corrected color mappings in palette (blue/orange/purple)
- Fixed command naming conventions for Neovim
- Improved fallback handling for nui.nvim dependency
- Updated all plugin theme files to use new color variable names

### Credits
- Original theme by [Loc](https://github.com/loctvl842/monokai-pro.nvim)
- Monokai Pro by [monokai.pro](https://monokai.pro/)

---

[0.1.5]: https://github.com/khoido2003/monokai-v2.nvim/compare/v0.1.4...v0.1.5
[0.1.4]: https://github.com/khoido2003/monokai-v2.nvim/compare/v0.1.3...v0.1.4
[0.1.3]: https://github.com/khoido2003/monokai-v2.nvim/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/khoido2003/monokai-v2.nvim/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/khoido2003/monokai-v2.nvim/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/khoido2003/monokai-v2.nvim/releases/tag/v0.1.0
