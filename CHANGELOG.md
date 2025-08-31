# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).


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
