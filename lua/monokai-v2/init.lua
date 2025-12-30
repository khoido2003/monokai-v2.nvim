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

  -- Try to load from compiled cache first
  if cache.load_compiled(config.filter, config) then
    if config.devicons then
      local colorscheme = require("monokai-v2.colorscheme")
      local devicons = require("monokai-v2.devicons")
      devicons.setup(colorscheme(config.filter))
    end
    return
  end

  -- Cache miss: generate, compile and load
  local theme = require("monokai-v2.theme")
  local hl_groups = theme.setup()

  -- Merge bufferline icons into the simplified highlight table
  local bufferline_icons = require("monokai-v2.theme.plugins.bufferline").setup_bufferline_icon() or {}
  hl_groups = vim.tbl_deep_extend("force", hl_groups, bufferline_icons)

  cache.compile(config.filter, hl_groups, config)
  cache.load_compiled(config.filter, config)
end
M._load = function(filter)
  require("monokai-v2.config").extend({ filter = filter })
  M.load()
end

return M
