local overrides = require "configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local merge_tb = vim.tbl_deep_extend
      local M = require "nvchad.configs.cmp"
      M = merge_tb("force", M, overrides.cmp)
      table.insert(M.sources, { name = "crates" })
      table.insert(M.sources, { name = "vimtex" })
      return M
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },

  {
    "folke/which-key.nvim",
    opts = overrides.whichkey,
  },
}

return plugins
