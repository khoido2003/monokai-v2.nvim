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

    -- Register plugin icon handlers and set up centralized autocmds.
    -- The cached path skips theme_util.load(), so we do it here.
    local bufferline_module = require("monokai-v2.theme.plugins.bufferline")
    if bufferline_module.register_icon_handler then
      bufferline_module.register_icon_handler()
    end
    local theme_util = require("monokai-v2.util.theme")
    theme_util.setup_plugin_icon_autocmds()
    return
  end

  -- Cache miss: generate, compile and load
  local theme = require("monokai-v2.theme")
  local hl_groups = theme.setup()

  cache.compile(config.filter, hl_groups, config)
  cache.load_compiled(config.filter, config)

  -- Register plugin icon handlers in the non-cached path as well.
  local bufferline_module = require("monokai-v2.theme.plugins.bufferline")
  if bufferline_module.register_icon_handler then
    bufferline_module.register_icon_handler()
  end
  local theme_util = require("monokai-v2.util.theme")
  theme_util.setup_plugin_icon_autocmds()
end
M._load = function(filter)
  require("monokai-v2.config").extend({ filter = filter })
  M.load()
end

return M
