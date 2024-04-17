local M = {}

M.treesitter = {
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
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",
  },
}

-- git support in nvimtree
M.nvimtree = {
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
}

local actions = require "telescope.actions"
M.telescope = {
  defaults = {
    mappings = {
      i = {
        -- ["<Down>"] = actions.cycle_history_next,
        -- ["<Up>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
}


local cmp = require "cmp"
M.cmp = {
  mapping = {
    -- ["<C-p>"] = {},
    -- ["<C-n>"] = {},
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-s>"] = require("cmp").mapping.complete(),
    ["<C-Space>"] = {},
  },
}

M.whichkey = {
  plugins = {
    presets = {
      operators = false,
    },
  },
}

return M
