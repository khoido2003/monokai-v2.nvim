local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    -- theHamsta/nvim-dap-virtual-text
    NvimDapVirtualText = { fg = c.base.dimmed2 },
    NvimDapVirtualTextChanged = { fg = c.base.yellow },
    NvimDapVirtualTextError = { fg = c.base.red },
  }
end

return M
