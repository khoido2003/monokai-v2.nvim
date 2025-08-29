# Monokai V2

A fork of [loctvl842/monokai-pro.nvim](https://github.com/loctvl842/monokai-pro.nvim) with personal improvements and additional plugin support.

## About

This is a personal fork of the excellent Monokai Pro theme for Neovim. While the original theme is already feature-rich and well-maintained, I've made some improvements to better suit my workflow and preferences.

### What's Different


## Installation

### Lazy.nvim (Recommended)

```lua
{
  "khoido2003/monokai-v2.nvim",
  priority = 1000,
  config = function()
    require("monokai-v2").setup()
    vim.cmd("colorscheme monokai-v2")
  end,
}
```

### Packer

```lua
use {
  "khoido2003/monokai-v2.nvim",
  config = function()
    require("monokai-v2").setup()
    vim.cmd("colorscheme monokai-v2")
  end
}
```

## Configuration

```lua
require("monokai-v2").setup({
  -- Basic settings
  transparent_background = false,
  terminal_colors = true,
  devicons = false,
  
  -- Syntax highlighting styles
  styles = {
    comment = { italic = false },
    keyword = { italic = false },
    type = { italic = false },
    storageclass = { italic = false },
    structure = { italic = false },
    parameter = { italic = false },
    annotation = { italic = false },
    tag_attribute = { italic = false },
  },
  
  -- Treesitter settings
  treesitter = {
    italic = false,
  },
  
  -- Filter selection (default: classic for dark, light for light background)
  filter = "classic", -- classic | light | machine | octagon | pro | ristretto | spectrum
  
  -- Day/night mode
  day_night = {
    enable = false,
    day_filter = "pro",
    night_filter = "spectrum",
  },
  
  -- Incremental search style
  inc_search = "background", -- underline | background
  
  -- Background clearing for floating windows
  background_clear = {
    "toggleterm",
    "telescope", 
    "renamer",
    "notify",
  },
  
  -- Plugin-specific settings
  plugins = {
    bufferline = {
      underline_selected = false,
      underline_visible = false,
      underline_fill = false,
      bold = true,
    },
    indent_blankline = {
      context_highlight = "default", -- default | pro
      context_start_underline = false,
    },
  },
})
```

## Usage

### Commands

- `MonokaiThemeSelect` - Interactive menu to select filter variant
- `MonokaiChoose <filter>` - Direct filter selection (e.g., `MonokaiChoose pro`)

### Statusline Integration

```lua
-- Lualine
require('lualine').setup({
  options = {
    theme = 'monokai-v2'
  }
})

-- Barbecue
require('barbecue').setup({
  theme = 'monokai-v2'
})

-- Lightline
let g:lightline = {'colorscheme': 'monokaiv2'}
```


## Filter Variants

Each filter provides a unique take on the Monokai Pro theme:

- **Classic** - The original Monokai theme (default for dark backgrounds)
- **Light** - Light variant for bright environments (default for light backgrounds)
- **Pro** - The signature Monokai Pro look
- **Machine** - Industrial, high-contrast variant
- **Octagon** - Geometric, structured appearance
- **Ristretto** - Muted, coffee-inspired tones
- **Spectrum** - Vibrant, colorful variant

## Credits

- **Original theme**: [loctvl842/monokai-pro.nvim](https://github.com/loctvl842/monokai-pro.nvim) by [Loc](https://github.com/loctvl842)
- **Monokai Pro**: [monokai.pro](https://monokai.pro/)

This is a personal fork with personal improvements and preferences. For the original, well-maintained theme, please check out the source repository.