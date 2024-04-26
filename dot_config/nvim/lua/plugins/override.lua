---@type NvPluginSpec[]
local plugins = {
  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      autotag = {
        enable = true,
      },
      ensure_installed = {
        "vim",
        "lua",
        "c",
      },
      indent = {
        enable = true,
        disable = {
          "python",
        },
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",
        "json-lsp",
        "taplo",
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      on_attach = require "configs.nvim-tree",
      trash = {
        cmd = "trash -F",
      },
      experimental = {
        git = {
          async = true,
        },
      },
      git = {
        enable = true,
      },
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
          glyphs = {
            git = {
              untracked = "", -- "󰧟",
            },
          },
        },
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "nvchad.configs.telescope"
      conf.defaults.mappings.i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
      }
      return conf
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local conf = require "nvchad.configs.cmp"

      conf.mapping = {
        ["<C-k>"] = require("cmp").mapping.select_prev_item(),
        ["<C-j>"] = require("cmp").mapping.select_next_item(),
        ["<C-s>"] = require("cmp").mapping.complete(),
        ["<C-Space>"] = {},
      }

      table.insert(conf.sources, { name = "crates" })
      table.insert(conf.sources, { name = "vimtex" })

      return conf
    end,
  },

  {
    "folke/which-key.nvim",
    opts = {
      plugins = {
        presets = {
          operators = false,
        },
      },
    },
  },
}

return plugins
