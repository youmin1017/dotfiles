---@type NvPluginSpec
local spec = {
  {
    "zbirenbaum/copilot.lua",
    event = { "InsertEnter" },
    cmd = { "Copilot" },
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept_word = false,
          accept_line = "<M-S-l>",
        },
      }
    }
  },
}

return spec
