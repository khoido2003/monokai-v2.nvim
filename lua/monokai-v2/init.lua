local M = {}

M.setup = function(opts)
  require("monokai-v2.config").setup(opts)
  -- Create commands early so they are available even before loading cache
  local command = require("monokai-v2.command")
  command.create_commands()
end

M.load = function()
  local config = require("monokai-v2.config")
  local cache = require("monokai-v2.cache")

  -- Try to load from compiled cache first
  if cache.load_compiled(config.filter, config) then
    if config.devicons then
      vim.schedule(function()
        local colorscheme = require("monokai-v2.colorscheme")
        local devicons = require("monokai-v2.devicons")
        devicons.setup(colorscheme(config.filter))
      end)
    end

    -- Bufferline icon autocmds are normally set up in theme_util.load(),
    -- but the cached path skips that. Register them here explicitly.
    local bufferline_module = require("monokai-v2.theme.plugins.bufferline")
    if bufferline_module.setup_icon_autocmds then
      bufferline_module.setup_icon_autocmds()
    end
    return
  end

  -- Cache miss: generate, compile and load
  local theme = require("monokai-v2.theme")
  local hl_groups = theme.setup()

  cache.compile(config.filter, hl_groups, config)
  cache.load_compiled(config.filter, config)
end
M._load = function(filter)
  require("monokai-v2.config").extend({ filter = filter })
  M.load()
end

return M
