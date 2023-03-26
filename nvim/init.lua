-- 行番号を表示
vim.opt.number = true
vim.opt.relativenumber = true
-- undoを永続化
vim.opt.undofile = true
-- 読み込み時の文字コードの自動判別. 左側が優先される
vim.opt.fileencodings = "ucs-boms,utf-8,euc-jp,cp932"
-- 改行コードの自動判別. 左側が優先される
vim.opt.fileformats = "unix,dos,mac"

-- set spell
-- set spelllang=en,cjk

require('plugins')
require('highlights')
require('maps')

if vim.g.vscode then

end
if not vim.g.vscode then
  -- 日本語の文字コード対応
  vim.opt.ambiwidth="single"
  vim.opt.shiftwidth = 4
  vim.opt.smarttab = true
  vim.opt.expandtab = true
end
