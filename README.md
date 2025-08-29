Monokai V2
==========

A small, personal fork of `loctvl842/monokai-pro.nvim`, renamed to `monokai-v2` and trimmed for my workflow.

Requirements
------------
- Neovim >= 0.8.0

Install (Lazy.nvim)
-------------------
```lua
{
  "khoido2003/monokai-v2.nvim",
  priority = 1000, -- load before other UI plugins
  config = function()
    require("monokai-v2").setup()
    vim.cmd("colorscheme monokai-v2")
  end,
}
```

Usage
-----
```lua
require("monokai-v2").setup({
  -- your options (filter = "pro" | "octagon" | "machine" | "ristretto" | "spectrum" | "classic")
})
vim.cmd("colorscheme monokai-v2")
```

Integrations
------------
- Lualine: `theme = 'monokai-v2'`
- Barbecue: `theme = 'monokai-v2'`
- Lightline: `let g:lightline = {'colorscheme': 'monokaiv2'}`

Attribution
-----------
- Original project: `loctvl842/monokai-pro.nvim`
- License: MIT (original copyright retained)