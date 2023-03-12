" vi非互換モード
set nocompatible
" クリップボードをシステムと共有
set clipboard+=unnamedplus
" 行番号を表示
set number
" undoを永続化
set undofile

" packer.nvim
lua require('plugins')

if exists('g:vscode')


else
	" シンタックスハイライト
	syntax enable
	" ファイルタイプ検出
	filetype plugin indent on
endif

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" Switch tab
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

" if executable('zenhan')
" 	autocmd InsertLeave * :call system('zenhan 0')
" 	autocmd CmdlineLeave * :call system('zenhan 0')
" endif

