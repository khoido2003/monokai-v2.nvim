local util = require("monokai-v2.util")
local config = require("monokai-v2.config")

local M = {}

M.create_filter_command = function()
  local cmd = vim.api.nvim_create_user_command

  cmd("Monokaiv2Select", function()
    local menu = util.ui.create_menu("Set monokai filter", {
      "classic",
      "light",
      "machine",
      "octagon",
      "pro",
      "ristretto",
      "spectrum",
    }, function(item)
      local filter = item.value
      config.extend({ filter = filter })
      vim.cmd([[colorscheme monokai-v2]])
    end)
    assert(menu, "Error: Fail to create menu")
    menu:mount()
  end, { nargs = 0 })

  cmd("Monokaiv2", function(opts)
    local filter = opts.args
    config.extend({ filter = filter })
    vim.cmd([[colorscheme monokai-v2]])
  end, {
    nargs = 1,
    complete = function()
      return {
        "classic",
        "light",
        "machine",
        "octagon",
        "pro",
        "ristretto",
        "spectrum",
      }
    end,
  })
end

return M
