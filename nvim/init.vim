" vi非互換モード
set nocompatible
" クリップボードをシステムと共有
set clipboard+=unnamedplus
" 行番号を表示
set number
set relativenumber
" undoを永続化
set undofile
" 読み込み時の文字コードの自動判別. 左側が優先される
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
" 改行コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac

set shiftwidth=4
set smarttab
set expandtab

" set spell
" set spelllang=en,cjk

lua require('plugins')
lua require('highlights')

if exists('g:vscode')


else
    " 日本語の文字コード対応
    set ambiwidth=double
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

