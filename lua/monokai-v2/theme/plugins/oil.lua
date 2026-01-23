local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    OilDir = { fg = c.base.cyan, bold = true },
    OilDirHidden = { fg = c.base.dimmed3 },
    OilSocket = { fg = c.base.green },
    OilLink = { fg = c.base.purple },
    OilFile = { fg = c.base.white },
    OilCreate = { fg = c.base.green },
    OilDelete = { fg = c.base.red },
    OilMove = { fg = c.base.orange },
    OilCopy = { fg = c.base.yellow },
    OilChange = { fg = c.base.yellow },
    OilPermission = { fg = c.base.dimmed2 },
    OilSize = { fg = c.base.dimmed2 },
    OilMtime = { fg = c.base.dimmed2 },
  }
end

return M
