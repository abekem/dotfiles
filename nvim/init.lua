if not vim.g.vscode then
  -- 行番号を表示
  vim.opt.number = true
  vim.opt.relativenumber = true
  -- 日本語の文字コード対応
  vim.opt.ambiwidth = "single"
  vim.opt.shiftwidth = 2
  vim.opt.smarttab = true
  vim.opt.expandtab = true
  -- 読み込み時の文字コードの自動判別. 左側が優先される
  vim.opt.fileencodings = "ucs-boms,utf-8,euc-jp,cp932"
  -- 改行コードの自動判別. 左側が優先される
  vim.opt.fileformats = "unix,dos,mac"

  local filetypes = require('filetypes')
  vim.api.nvim_create_augroup('vimrc_augroup', {})
  vim.api.nvim_create_autocmd('FileType', {
    group = 'vimrc_augroup',
    pattern = '*',
    callback = function(args) filetypes[args.match]() end
  })
end

if vim.fn.has "macunix" == 1 then
  vim.opt.clipboard:append { 'unnamedplus' }
end
if vim.fn.has "win32" == 1 then
  vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }
end

-- 折り畳みをインデント単位で有効にする
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
--undoを永続化
vim.opt.undofile = true

require('plugins')
require('highlights')
require('maps')
