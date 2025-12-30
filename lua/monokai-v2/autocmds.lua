-- Monokai-v2 autocmds
local M = {}

local timer = nil

local function check_day_night()
  local config = require("monokai-v2.config")
  if not config.day_night or not config.day_night.enable then
    return
  end

  local util_extra = require("monokai-v2.util.extra")
  local is_day = util_extra.is_daytime()
  local target_filter = is_day and config.day_night.day_filter or config.day_night.night_filter
  local current_filter = require("monokai-v2.colorscheme").filter

  if target_filter ~= current_filter then
    vim.schedule(function()
      pcall(function()
        require("monokai-v2")._load(target_filter)
        -- Notify user about the switch
        vim.notify(
          "Monokai-v2: Switched to " .. target_filter .. " (" .. (is_day and "Day" or "Night") .. ") mode",
          vim.log.levels.INFO
        )
      end)
    end)
  end
end

-- Initialize timer linked to the timer variable
local config = require("monokai-v2.config")
local uv = vim.uv or vim.loop
if config.day_night and config.day_night.enable and not timer then
  timer = uv.new_timer()
  -- Check every 1 hour (3600000 ms)
  timer:start(0, 3600000, vim.schedule_wrap(check_day_night))
end

return M
