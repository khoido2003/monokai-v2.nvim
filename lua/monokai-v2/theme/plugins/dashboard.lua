local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    -- General
    DashboardHeader = { fg = c.base.yellow },
    DashboardFooter = { fg = c.base.green },
    -- Doome theme
    DashboardKey = { fg = c.base.cyan },
    DashboardDesc = { fg = c.base.dimmed1 },
    DashboardIcon = { fg = c.base.orange },
    -- Hyper theme
    DashboardProjectTitle = { fg = c.base.yellow },
    DashboardMruTitle = { fg = c.base.yellow },
    DashboardFiles = { fg = c.base.orange },
    DashboardShortcut = { fg = c.base.purple },
  }
end

return M
