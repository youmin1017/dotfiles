local function vimtex_init()
  vim.g.vimtex_view_method = "skim"
  vim.g.vimtex_view_general_viewer = "skim"
  -- vim.g.vimtex_view_general_viewer = "/Applications/Skim.app/Contents/SharedSupport/displayline"
  -- vim.g.vimtex_compiler_callback_hooks = "UpdateSkim"

  vim.g.vimtex_compiler_latexmk_engines = {
    _ = "-xelatex",
  }

  vim.g["vimtex_quickfix_mode"] = 0 -- suppress error reporting on save and build
  vim.g["vimtex_mappings_enabled"] = 0 -- Ignore mappings
  vim.g["vimtex_indent_enabled"] = 0 -- Auto Indent
  vim.g["tex_flavor"] = "latex" -- how to read tex files
  vim.g["tex_indent_items"] = 0 -- turn off enumerate indent
  vim.g["tex_indent_brace"] = 0 -- turn off brace indent
  vim.g["vimtex_context_pdf_viewer"] = "skim" -- external PDF viewer run from vimtex menu command
  vim.g["vimtex_log_ignore"] = { -- Error suppression:
    "Underfull",
    "Overfull",
    "specifier changed to",
    "Token not allowed in a PDF string",
  }
end

return vimtex_init
