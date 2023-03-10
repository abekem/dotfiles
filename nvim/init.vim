" vi非互換モード
set nocompatible
" クリップボードをシステムと共有
set clipboard+=unnamedplus
" 行番号を表示
set number
" undoを永続化
set undofile

if exists('g:vscode')


else
	" シンタックスハイライト
	syntax enable
	" ファイルタイプ検出
	filetype plugin indent on
endif

" if executable('zenhan')
" 	autocmd InsertLeave * :call system('zenhan 0')
" 	autocmd CmdlineLeave * :call system('zenhan 0')
" endif

