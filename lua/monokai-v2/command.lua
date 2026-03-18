local util = require("monokai-v2.util")
local config = require("monokai-v2.config")

local M = {}

local FILTERS = {
  "classic",
  "light",
  "machine",
  "octagon",
  "pro",
  "ristretto",
  "spectrum",
}

local function apply_filter(filter)
  if not filter or filter == "" then
    return
  end
  config.extend({ filter = filter })
  vim.cmd([[colorscheme monokai-v2]])
end

local function open_filter_picker()
  local menu = util.ui.create_menu("Set monokai filter", FILTERS, function(item)
    local value = item and (item.value or item)
    apply_filter(value)
  end)
  if menu then
    menu:mount()
    return
  end
  vim.ui.select(FILTERS, { prompt = "Monokai theme filter" }, function(choice)
    apply_filter(choice)
  end)
end

local function complete_filter_arg()
  return FILTERS
end

local function complete_cache_action()
  return { "compile", "clear" }
end

function M.create_commands()
  local cmd = vim.api.nvim_create_user_command

  cmd("MonokaiFilter", function(opts)
    if not opts.args or opts.args == "" then
      open_filter_picker()
      return
    end
    apply_filter(opts.args)
  end, {
    nargs = "?",
    complete = complete_filter_arg,
    desc = "monokai-v2: pick or set a filter",
  })

  cmd("MonokaiCache", function(opts)
    local action = (opts.args or ""):lower()
    if action == "" then
      vim.notify("monokai-v2: usage: :MonokaiCache [compile|clear]", vim.log.levels.INFO)
      return
    end

    local cache = require("monokai-v2.cache")
    if action == "clear" then
      cache.clear()
      vim.notify("Monokai-v2: Cache cleared!", vim.log.levels.INFO)
      return
    end

    if action == "compile" then
      cache.clear()
      vim.cmd([[colorscheme monokai-v2]])
      vim.notify("Monokai-v2: Theme compiled and cached!", vim.log.levels.INFO)
      return
    end

    vim.notify("monokai-v2: unknown action: " .. action .. " (expected compile|clear)", vim.log.levels.WARN)
  end, {
    nargs = "?",
    complete = complete_cache_action,
    desc = "monokai-v2: manage highlight cache",
  })
end

return M
