local util = require("monokai-v2.util")
local config = require("monokai-v2.config")

local M = {}

M.create_filter_command = function()
  local cmd = vim.api.nvim_create_user_command

  cmd("MonokaiThemeSelect", function()
    local filters = {
      "classic",
      "light",
      "machine",
      "octagon",
      "pro",
      "ristretto",
      "spectrum",
    }
    local menu = util.ui.create_menu("Set monokai filter", filters, function(item)
      local value = item and (item.value or item)
      if not value then
        return
      end
      config.extend({ filter = value })
      vim.cmd([[colorscheme monokai-v2]])
    end)
    if menu then
      menu:mount()
    else
      vim.ui.select(filters, { prompt = "Monokai theme filter" }, function(choice)
        if not choice then
          return
        end
        config.extend({ filter = choice })
        vim.cmd([[colorscheme monokai-v2]])
      end)
    end
  end, { nargs = 0 })

  cmd("MonokaiChoose", function(opts)
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
