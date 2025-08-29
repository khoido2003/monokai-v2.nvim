local util = require("monokai-v2.util")
---@class monokaiv2Options
---@field plugins? PluginConfig
---@field override? fun(c: Colorscheme)
---@field overridePalette? fun(filter: Filter) A function to override palette
---@field overrideScheme? fun(cs: Colorscheme, p: ColorschemeOptions, Config: monokaiv2Options, hp: Helper) A function to override scheme
local config = {
  transparent_background = false,
  terminal_colors = true,
  devicons = false,
  styles = {
    comment = { italic = false },
    keyword = { italic = false }, -- any other keyword
    type = { italic = false }, -- (preferred) int, long, char, etc
    storageclass = { italic = false }, -- static, register, volatile, etc
    structure = { italic = false }, -- struct, union, enum, etc
    parameter = { italic = false }, -- parameter pass in function
    annotation = { italic = false },
    tag_attribute = { italic = false }, -- attribute of tag in reactjs
  },
  treesitter = {
    italic = false,
  },
  filter = vim.o.background == "light" and "classic" or "pro", -- classic | octagon | pro | machine | ristretto | spectrum
  day_night = {
    enable = false,
    day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
    night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
  },
  inc_search = "background", -- underline | background
  background_clear = {
    "toggleterm",
    "telescope",
    "renamer",
    "notify",
  },
  plugins = {
    bufferline = {
      underline_selected = false,
      underline_visible = false,
      underline_fill = false,
      bold = true,
    },
    indent_blankline = {
      context_highlight = "default", -- default | pro
      context_start_underline = false,
    },
  },
}

---@class Config: monokaiv2Options
local M = setmetatable({}, {
  __index = function(_, k)
    return rawget(config or {}, k)
  end,
  __newindex = function(t, k, v)
    if rawget(config or {}, k) ~= nil then
      error("monokai-v2.nvim: Attempt to change option " .. k .. " directly, use `setup` instead")
    else
      rawset(t, k, v)
    end
  end,
  __call = function(t, ...)
    return t.setup(...)
  end,
})

---@param options? monokaiv2Options
M.setup = function(options)
  config = vim.tbl_deep_extend("force", config, options or {})
  local day_night = config.day_night
  if day_night and day_night.enable then
    config.filter = util.extra.is_daytime() and day_night.day_filter or day_night.night_filter
  end
end

---@param options? monokaiv2Options
M.extend = function(options)
  config = vim.tbl_deep_extend("force", {}, config or options, options or {})
end

M.setup()

return M
