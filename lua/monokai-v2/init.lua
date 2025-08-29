local config = require("monokai-v2.config")
local util = require("monokai-v2.util")
local theme = require("monokai-v2.theme")
local command = require("monokai-v2.command")

---@class monokaiv2
local M = {}

M.load = function()
  util.theme.load(theme.setup())
end

--- @param filter "light" | "classic" | "machine" | "octagon" | "pro" | "ristretto" | "spectrum"
M._load = function(filter)
  config.extend({ filter = filter })
  M.load()
end

M.setup = function(options)
  config.setup(options)
  command.create_filter_command()
end

return M

