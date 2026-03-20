if vim.g.vscode then return end
local status, indent = pcall(require, "indent_blankline")
if (not status) then return end
vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

vim.cmd [[highlight IndentBlanklineChar guifg=#657b83 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#719e07 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextStart cterm=underline gui=underline guisp=#719e07]]
vim.cmd [[highlight IndentBlanklineSpaceChar guifg=#657b83 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineSpaceCharBlankline guifg=#657b83 gui=nocombine]]

indent.setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}
