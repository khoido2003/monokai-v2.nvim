local colors = require("monokai-v2.colorscheme")

local M = {}

M.normal = {
  left = {
    { colors.base.black, colors.base.green },
    { colors.base.green, colors.editorSuggestWidget.background },
  },
  middle = { { colors.base.black, colors.base.black } },
  right = {
    { colors.base.black, colors.base.green },
    { colors.base.green, colors.editorSuggestWidget.background },
  },
  error = { { colors.base.black, colors.base.red } },
  warning = { { colors.base.black, colors.base.orange } },
}

M.insert = {
  left = {
    { colors.base.black, colors.base.yellow },
    { colors.base.yellow, colors.editorSuggestWidget.background },
  },
}

M.visual = {
  left = {
    { colors.base.black, colors.base.purple },
    { colors.base.purple, colors.editorSuggestWidget.background },
  },
}

M.replace = {
  left = {
    { colors.base.black, colors.base.red },
    { colors.base.red, colors.editorSuggestWidget.background },
  },
}

M.inactive = {
  left = {
    { colors.base.green, colors.base.black },
    { colors.base.black, colors.base.black },
  },
  middle = {
    { colors.base.black, colors.base.black },
  },
}

package.loaded["colors"] = nil

return M
