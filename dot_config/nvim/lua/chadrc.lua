-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme_toggle = { "catppuccin", "one_light" },
  theme = "catppuccin",
  -- hl_add = highlights.add,
  transparency = false,
  nvdash = {
    load_on_startup = true,
  },

  hl_override = {
    CursorLine = { bg = "black2" },
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },

  term = {
    -- hl = "Normal:term,WinSeparator:WinSeparator",
    -- sizes = { sp = 0.3, vsp = 0.2 },
    float = {
      relative = "editor",
      row = 0.15,
      col = 0.1,
      width = 0.8,
      height = 0.7,
      border = "single",
    },
  },
}

return M
