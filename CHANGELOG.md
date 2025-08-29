# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
