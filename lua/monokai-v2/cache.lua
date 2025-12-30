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
  -- Copy safe values
  for k, v in pairs(config) do
    local t = type(v)
    if t == "boolean" or t == "string" or t == "number" then
      state[k] = v
    elseif t == "table" then
      state[k] = v -- Tables are typically safe (styles, etc)
    elseif t == "function" then
      -- Try to dump function to detect logic changes
      -- This might fail with upvalues, in which case we fallback
      local ok, dump = pcall(string.dump, v)
      if ok then
        state[k] = dump
      else
        state[k] = tostring(v) -- Unstable, will cause recompile on restart, which is safe/correct
      end
    end
  end
  return state
end

function M.load_cached(filter, current_config)
  local path = M.get_cache_path(filter)
  if vim.fn.filereadable(path) == 0 then
    return nil
  end
  
  local ok, cached = pcall(dofile, path)
  if not ok or not cached or not cached.config or not cached.highlights then
    return nil
  end

  -- Verify config match
  local current_state = get_config_state(current_config)
  if not vim.deep_equal(cached.config, current_state) then
    return nil
  end
  
  return cached.highlights
end

function M.save_cache(filter, hl_groups, current_config)
  ensure_dir()
  local path = M.get_cache_path(filter)
  local config_state = get_config_state(current_config)
  
  local lines = { "return {" }
  
  -- Serialize Config
  table.insert(lines, string.format("  config = %s,", vim.inspect(config_state)))
  
  -- Serialize Highlights
  table.insert(lines, "  highlights = {")
  for group, opts in pairs(hl_groups) do
    if type(opts) == "table" then
      local parts = {}
      if opts.fg then table.insert(parts, string.format('fg = "%s"', opts.fg)) end
      if opts.bg then table.insert(parts, string.format('bg = "%s"', opts.bg)) end
      if opts.sp then table.insert(parts, string.format('sp = "%s"', opts.sp)) end
      if opts.fmt then table.insert(parts, string.format('fmt = "%s"', opts.fmt)) end
      if opts.link then table.insert(parts, string.format('link = "%s"', opts.link)) end
      -- Boolean flags
      for _, key in ipairs({"bold", "italic", "underline", "undercurl", "underdouble", "underdotted", "underdashed", "strikethrough", "reverse", "nocombine"}) do
        if opts[key] then table.insert(parts, key .. ' = true') end
      end
      
      table.insert(lines, string.format('    ["%s"] = { %s },', group, table.concat(parts, ", ")))
    end
  end
  
  table.insert(lines, "  }")
  table.insert(lines, "}")
  
  local file = io.open(path, "w")
  if file then
    file:write(table.concat(lines, "\n"))
    file:close()
  end
end

function M.clear()
  if vim.fn.isdirectory(cache_dir) == 1 then
    vim.fn.delete(cache_dir, "rf")
  end
end

return M
