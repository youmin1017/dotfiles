return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      sources = { "filesystem", "document_symbols" },
      filesystem = {
        window = {
          mappings = {
            ["H"] = "none",
            ["z"] = "none",
            ["I"] = "toggle_hidden",
            ["<C-w>"] = "close_all_nodes",
          },
        },
      },
    },
  },
}
