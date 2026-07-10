local filter = vim.g.monokaiv2_filter or (vim.o.background == "light" and "light" or "pro")
local cache_path = vim.fn.stdpath("cache") .. "/monokai-v2/compiled_" .. filter .. ".lua"
local f = loadfile(cache_path)
if f then
  local ok, cached = pcall(f)
  if ok and cached and cached.load then
    cached.load()
    return
  end
end

require("monokai-v2").load()
