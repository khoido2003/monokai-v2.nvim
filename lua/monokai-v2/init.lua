local M = {}

M.setup = function(opts)
  require("monokai-v2.config").setup(opts)
  -- Create commands early so they are available even before loading cache
  local command = require("monokai-v2.command")
  command.create_filter_command()
  command.create_cache_commands()
end

M.load = function()
  local config = require("monokai-v2.config")
  local cache = require("monokai-v2.cache")
  local util_theme = require("monokai-v2.util.theme")

  -- Try to load from cache first, validating config
  local cached_hl = cache.load_cached(config.filter, config)
  if cached_hl then
    util_theme.load(cached_hl)
    return
  end

  -- Cache miss: generate and save
  local theme = require("monokai-v2.theme")
  local hl_groups = theme.setup()
  cache.save_cache(config.filter, hl_groups, config)
  util_theme.load(hl_groups)
end

M._load = function(filter)
  require("monokai-v2.config").extend({ filter = filter })
  M.load()
end

return M
