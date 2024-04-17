require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- disable keympas
map("n", "<leader>f", "<nop>")
map("n", "<leader>e", "<nop>")
map("n", "<C-s>", "<nop>")

-- custom mappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
map({"n", "x"}, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Editor Move down", expr = true })
map({"n", "x"}, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Editor Move down", expr = true })
map({"n", "x"}, "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Editor Move down", expr = true})
map({"n", "x"}, "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Editor Move down", expr = true })

map("n", ">", ">>", { nowait = true, desc = "Editor Indent forward easily" })
map("n", "<", "<<", { nowait = true, desc = "Editor Indent backword easily" })
map("x", ">", ">gv", { nowait = true, desc = "Editor Indent forward easily" })
map("x", "<", "<gv", { nowait = true, desc = "Editor Indent backword easily" })
map({ "n", "x" }, "gh", "g0", { desc = "Editor Go to begging" })
map({ "n", "x" }, "gl", "g$", { desc = "Editor Go to end of line" })
map("n", "<leader>X", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "Buffer Close all buffer" })

-- clipboard: normal/visual mode
map({"n", "x"}, "<leader>y", '"+y', { desc = "Editor Yank to system clipboard" })
map({"n", "x"}, "<leader>Y", '"+yy', { desc = "Editor Yank line to system clipboard" })
map({"n", "x"}, "<leader>p", '"+p', { desc = "Editor Paste from system clipboard" })
map({"n", "x"}, "<leader>P", '"+P', { desc = "Editor Paste from system clipboard before cursor" })
map({"n", "x"}, "<leader>d", '"+d', { desc = "Editor Delete to system clipboard" })

-- Move Line
map("n", "<M-j>", ":m .+1<CR>==", { desc = "Editor move selected block up and stay in visual mode" })
map("n", "<M-k>", ":m .-2<CR>==", { desc = "Editor move selected down and stay in visual mode" })
map("x", "<M-j>", ":move '>+1<CR>gv-gv", { desc = "Editor move selected block up and stay in visual mode" })
map("x", "<M-k>", ":move '<-2<CR>gv-gv", { desc = "Editor move selected down and stay in visual mode" })

-- Telescope
map("n", "<leader>fd", "<cmd> Telescope diagnostics <CR>", { desc = "Telescope List diagnostics"})
map("n", "<leader>fc", "<cmd> Telescope command_history <CR>", { desc = "Telescope List command historys"})
