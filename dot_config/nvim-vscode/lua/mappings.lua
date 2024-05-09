local vscode = require("vscode-neovim")

local map = vim.keymap.set

-- VSCode Mappings
map("n", "<leader>fm", function()
  vscode.call("editor.action.formatDocument")
end)
map("x", "<leader>fm", function()
  vscode.call("editor.action.formatSelection")
end)
map({ "n", "x" }, "<leader>/", function()
  vscode.call("editor.action.commentLine")
end)
map("n", "<leader>x", function()
  vscode.call("workbench.action.closeActiveEditor")
end)
map("n", "<leader>X", function()
  vscode.call("workbench.action.closeAllEditors")
end)
map("n", "<leader>ff", function()
  vscode.call("editor.toggleFold")
end)
map("n", "<leader>r", function()
  vscode.call("editor.action.rename")
end)
map("n", "<leader>h", function()
  local inlay_hints_cfg = "editor.inlayHints.enabled"
  if vscode.get_config(inlay_hints_cfg) == "offUnlessPressed" then
    vscode.update_config(inlay_hints_cfg, "on", "global")
  else
    vscode.update_config(inlay_hints_cfg, "offUnlessPressed", "global")
  end
end)
map("n", "<leader>jd", function()
  vscode.call("notebook.cell.clearOutputs")
end)
map("n", "<leader>jd", function()
  vscode.call("notebook.clearAllCellsOutputs")
end)
map("n", "<leader>q", function()
  vscode.call("mssql.runCurrentStatement")
end)
map("x", "<leader>q", function()
  vscode.call("mssql.runQuery")
end)

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", ">", ">>", { nowait = true, desc = "Editor Indent forward easily" })
map("n", "<", "<<", { nowait = true, desc = "Editor Indent backword easily" })
map("x", ">", ">gv", { nowait = true, desc = "Editor Indent forward easily" })
map("x", "<", "<gv", { nowait = true, desc = "Editor Indent backword easily" })
map({ "n", "x" }, "gh", "g0", { desc = "Editor Go to begging" })
map({ "n", "x" }, "gl", "g$", { desc = "Editor Go to end of line" })

-- system clipboard: normal/visual mode
map({ "n", "x" }, "<leader>y", '"+y', { desc = "Editor Yank to system clipboard" })
map({ "n", "x" }, "<leader>Y", '"+yy', { desc = "Editor Yank line to system clipboard" })
map({ "n", "x" }, "<leader>p", '"+p', { desc = "Editor Paste from system clipboard" })
map({ "n", "x" }, "<leader>P", '"+P', { desc = "Editor Paste from system clipboard before cursor" })
map({ "n", "x" }, "<leader>d", '"+d', { desc = "Editor Delete to system clipboard" })
map({ "x" }, "p", '"_dP', { silent = true })

-- cursor movement
map({ "n" }, "j", function()
  vscode.call("cursorMove", { args = { to = "down", by = "wrappedLine", value = vim.v.count1 } })
end)
map({ "n" }, "k", function()
  vscode.call("cursorMove", { args = { to = "up", by = "wrappedLine", value = vim.v.count1 } })
end)

-- move line
-- If not working, try to add this to your keybindings.json
-- { "key": "alt+j", "command": "vscode-neovim.send", "args": "<a-j>", "when": "editorTextFocus && neovim.init" },
-- { "key": "alt+k", "command": "vscode-neovim.send", "args": "<a-k>", "when": "editorTextFocus && neovim.init" },
map("n", "<M-j>", "<cmd>m .+1<CR>==", { silent = true })
map("n", "<M-k>", "<cmd>m .-2<CR>==", { silent = true })
-- map("x", "<M-j>", "<cmd>m '>+1<CR>gv-gv", { silent = true })
-- map("x", "<M-k>", "<cmd>m '<-2<CR>gv-gv", { silent = true })
map("x", "<M-j>", function()
  vscode.call("editor.action.moveLinesDownAction")
end, { silent = true })
map("x", "<M-k>", function()
  vscode.call("editor.action.moveLinesUpAction")
end, { silent = true })

map("n", "<Esc>", "<cmd> noh <CR>")
