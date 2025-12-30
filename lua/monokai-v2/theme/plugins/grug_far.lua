local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    GrugFarHelp = { fg = c.base.dimmed4 },
    GrugFarInputLabel = { fg = c.base.cyan },
    GrugFarInputPlaceholder = { fg = c.base.dimmed3 },
    GrugFarResultsMatch = { fg = c.base.black, bg = c.base.yellow, bold = true },
    GrugFarResultsPath = { fg = c.base.purple },
    GrugFarResultsLineNo = { fg = c.base.dimmed4 },
  }
end

return M
