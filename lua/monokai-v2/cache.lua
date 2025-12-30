local M = {}
local cache_dir = vim.fn.stdpath("cache") .. "/monokai-v2"

-- Ensure cache directory exists
local function ensure_dir()
  if vim.fn.isdirectory(cache_dir) == 0 then
    vim.fn.mkdir(cache_dir, "p")
  end
end

function M.get_cache_path(filter)
  return string.format("%s/compiled_%s.lua", cache_dir, filter)
end

-- Generate a hash/signature for the config to invalidate cache on changes
local function get_config_state(config)
  local state = {}
  -- Handle proxy table from config module
  local c = type(config.get) == "function" and config.get() or config
  for k, v in pairs(c) do
    if type(v) ~= "function" and k ~= "overridePalette" and k ~= "overrideScheme" then
      state[k] = v
    end
  end
  return state
end

function M.compile(filter, hl_groups, config)
  ensure_dir()
  local theme_util = require("monokai-v2.util.theme")
  local path = M.get_cache_path(filter)
  local config_state = get_config_state(config)

  local lines = {
    "return function(current_config)",
    string.format("  local cached_config = %s", vim.inspect(config_state)),
    "  if not vim.deep_equal(cached_config, current_config) then return false end",
    "",
    "  if vim.g.colors_name then vim.cmd('hi clear') end",
    "  vim.o.termguicolors = true",
    "  vim.g.colors_name = 'monokai-v2'",
    string.format("  vim.o.background = '%s'", config.filter == "light" and "light" or "dark"),
  }

  -- Build optimized nvim_set_hl calls
  for group, opts in pairs(hl_groups) do
    if type(opts) == "table" then
      -- Resolve dynamic colors (9-digit hex) to static colors (7-digit)
      local resolved = theme_util.resolve_highlight(opts)

      -- Filter out nil/empty keys to keep the file small
      local parts = {}
      if resolved.fg then
        table.insert(parts, string.format('fg = "%s"', resolved.fg))
      end
      if resolved.bg then
        table.insert(parts, string.format('bg = "%s"', resolved.bg))
      end
      if resolved.sp then
        table.insert(parts, string.format('sp = "%s"', resolved.sp))
      end
      if resolved.link then
        table.insert(parts, string.format('link = "%s"', resolved.link))
      end

      -- Boolean flags
      local bool_keys = {
        "bold",
        "italic",
        "underline",
        "undercurl",
        "underdouble",
        "underdotted",
        "underdashed",
        "strikethrough",
        "reverse",
        "nocombine",
      }
      for _, key in ipairs(bool_keys) do
        if resolved[key] then
          table.insert(parts, key .. " = true")
        end
      end

      if #parts > 0 then
        table.insert(lines, string.format('  vim.api.nvim_set_hl(0, "%s", { %s })', group, table.concat(parts, ", ")))
      end
    end
  end

  -- Autocmds
  if config.day_night and config.day_night.enable then
    table.insert(lines, '  pcall(require, "monokai-v2.autocmds")')
  end
  table.insert(lines, "  return true")
  table.insert(lines, "end")

  local file = io.open(path, "w")
  if file then
    file:write(table.concat(lines, "\n"))
    file:close()
  end
end

function M.load_compiled(filter, config)
  local path = M.get_cache_path(filter)
  local f = loadfile(path)
  if f then
    -- f() returns the compiled function
    -- we call that function with the current config state
    local current_state = get_config_state(config)

    local success, result = pcall(f(), current_state)
    if success and result then
      return true
    end
  end
  return false
end

function M.clear()
  if vim.fn.isdirectory(cache_dir) == 1 then
    vim.fn.delete(cache_dir, "rf")
  end
end

return M
