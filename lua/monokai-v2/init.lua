local M = {}

M.setup = function(opts)
  local config = require("monokai-v2.config")
  config.setup(opts)
  vim.g.monokaiv2_filter = config.filter

  local cache = require("monokai-v2.cache")
  if not cache.check_validity(config.filter, config) then
    cache.clear()
  end

  vim.schedule(function()
    local command = require("monokai-v2.command")
    command.create_commands()
  end)
end

M.load = function()
  local config = require("monokai-v2.config")
  local cache = require("monokai-v2.cache")

  local theme = require("monokai-v2.theme")
  local hl_groups = theme.setup()

  cache.compile(config.filter, hl_groups, config)

  local path = cache.get_cache_path(config.filter)
  local f = loadfile(path)
  if f then
    local ok, cached = pcall(f)
    if ok and cached and cached.load then
      cached.load()
    end
  end
end

M._load = function(filter)
  require("monokai-v2.config").extend({ filter = filter })
  M.load()
end

return M
