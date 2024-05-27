---@type NvPluginSpec[]
local plugins = {
  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
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
      return conf
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local conf = require "nvchad.configs.cmp"
      local cmp = require "cmp"

      conf.mapping["<C-k>"] = cmp.mapping.select_prev_item()
      conf.mapping["<C-j>"] = cmp.mapping.select_next_item()
      conf.mapping["<C-s>"] = cmp.mapping.complete()
      conf.mapping["<C-Space>"] = nil

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
