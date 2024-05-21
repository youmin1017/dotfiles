local bufnr = vim.api.nvim_get_current_buf()
local function desc(description)
  return { noremap = true, silent = true, buffer = bufnr, desc = description }
end

vim.keymap.set("v", "K", function()
  vim.cmd.RustLsp { "hover", "range" }
end, desc "Rust hover range")
vim.keymap.set("n", "<leader>rtt", function()
  vim.cmd.RustLsp "testables"
end, desc "Rust [t]es[t]ables")
vim.keymap.set("n", "<leader>rtl", function()
  vim.cmd.RustLsp { "testables", bang = true }
end, desc "Rust run [t]estables [l]ast")
vim.keymap.set("n", "<leader>rk", function()
  vim.cmd.RustLsp { "moveItem", "up" }
end, desc "Rust move item up [k]")
vim.keymap.set("n", "<leader>rj", function()
  vim.cmd.RustLsp { "moveItem", "down" }
end, desc "Rust move item down [j]")
vim.keymap.set("n", "<leader>ca", function()
  vim.cmd.RustLsp "codeAction"
end, desc "Rust [c]ode [a]ctions")
