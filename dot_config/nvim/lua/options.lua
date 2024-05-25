require "nvchad.options"

-- add yours here!

vim.o.cursorlineopt = "both" -- to enable cursorline!

vim.opt.formatoptions:append "mM"
vim.o.clipboard = nil
vim.opt.scrolloff = 5

vim.wo.wrap = false

-------------------------------------- autocmnds ------------------------------------------
local autocmd = vim.api.nvim_create_autocmd
autocmd("VimEnter", {
  callback = function(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
      return
    end

    -- change to the directory
    vim.cmd.cd(data.file)

    -- open the tree
    require("nvim-tree.api").tree.open()
  end,
})
