local colors = require("monokai-v2.colorscheme")

local M = {}

M.normal = {
  a = { bg = colors.base.green, fg = colors.base.black, gui = "bold" },
  b = { bg = colors.base.dimmed5, fg = colors.base.green },
  c = {
    bg = colors.statusBar.background,
    fg = colors.statusBar.activeForeground,
  },
  x = {
    bg = colors.statusBar.background,
    fg = colors.statusBar.activeForeground,
  },
}

M.insert = {
  a = { bg = colors.base.yellow, fg = colors.base.black },
  b = { bg = colors.base.dimmed5, fg = colors.base.yellow },
}

M.command = {
  a = { bg = colors.base.orange, fg = colors.base.black },
  b = { bg = colors.base.dimmed5, fg = colors.base.orange },
}

M.visual = {
  a = { bg = colors.base.purple, fg = colors.base.black },
  b = { bg = colors.base.dimmed5, fg = colors.base.orange },
}

M.replace = {
  a = { bg = colors.base.red, fg = colors.base.black },
  b = { bg = colors.base.dimmed5, fg = colors.base.red },
}

M.inactive = {
  a = { bg = colors.base.black, fg = colors.base.yellow },
  b = { bg = colors.base.black, fg = colors.base.black },
}

return M
