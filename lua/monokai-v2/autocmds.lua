-- Monokai-v2 autocmds
local M = {}

local timer = nil
local augroup = nil

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

--- Stop the day/night timer and clean up autocmds
function M.cleanup()
  if timer then
    timer:stop()
    timer:close()
    timer = nil
  end
  if augroup then
    pcall(vim.api.nvim_del_augroup_by_id, augroup)
    augroup = nil
  end
end

--- Initialize the day/night timer if enabled
function M.setup()
  local config = require("monokai-v2.config")
  local uv = vim.uv or vim.loop

  -- Clean up any existing timer/autocmds first
  M.cleanup()

  if config.day_night and config.day_night.enable then
    -- Create timer
    timer = uv.new_timer()
    -- Check every 1 hour (3600000 ms)
    timer:start(0, 3600000, vim.schedule_wrap(check_day_night))

    -- Create autocmd to clean up when switching colorschemes
    augroup = vim.api.nvim_create_augroup("MonokaiV2DayNight", { clear = true })
    vim.api.nvim_create_autocmd("ColorSchemePre", {
      group = augroup,
      callback = function()
        -- Only cleanup if switching away from monokai-v2
        vim.schedule(function()
          if vim.g.colors_name ~= "monokai-v2" then
            M.cleanup()
          end
        end)
      end,
    })
  end
end

-- Auto-initialize when this module is loaded
M.setup()

return M
