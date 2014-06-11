" Configuration file for vim↲
set modelines=0		" CVE-2007-2438

set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
"au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
"au BufWrite /private/etc/pw.* set nowritebackup

syntax enable
"syntax on

"行番号の表示
set number

"vi互換をオフ
"set nocompatible

"新しい行のインデントを現在行と同じにする
set autoindent

"インクリメンタルサーチ設定
set incsearch

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"バックアップファイルいらない
set nobackup

" ファイル編集中にスワップファイルを作らない
set noswapfile

" タブの下げ幅をスペース4個分に
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4

"タブ、空白、改行の表示
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
   
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif


"Mac ClipBoard
"visual modeでコピーしたい部分を選択して `sy' でClipBoardに入る
vmap <silent> sy :!pbcopy; pbpaste<CR> 
"`sp' でClipBoardから張り付け。インサートモードでctr+vでも貼り付けできる
map <silent> sp <esc>o<esc>v :!pbpaste<CR>


"-------------------------------------------------
" neocomplcache設定
"-------------------------------------------------
autocmd BufRead *.php\|*.ctp\|*.tpl :set dictionary=~/.vim/dictionaries/php.dict filetype=php
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_caching_percent_in_statusline = 1
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'


"----------------------------------------------------
" neobundle.vim
"----------------------------------------------------
set nocompatible
filetype plugin indent off

if has('vim_starting')
	  set runtimepath+=~/.vim/bundle/neobundle.vim/
	    call neobundle#rc(expand('~/.vim/bundle/'))
	    endif

	    NeoBundle 'Shougo/neobundle.vim'
	    NeoBundle 'Shougo/neocomplcache'
	    NeoBundle 'taichouchou2/alpaca_powertabline'
		NeoBundle 'surround.vim'
		NeoBundle 'Shougo/vimfiler'
		NeoBundle 'Shougo/unite.vim'
		NeoBundle 'bling/vim-airline'
        NeoBundle 'Yggdroot/indentLine'

	    " Color Scheme
		NeoBundle 'tomasr/molokai'
	    NeoBundle 'altercation/vim-colors-solarized'
		NeoBundle 'nanotech/jellybeans.vim'
		NeoBundle 'w0ng/vim-hybrid'
		NeoBundle 'jpo/vim-railscasts-theme'
		
		NeoBundleCheck
		
	    filetype plugin indent on
		
		"filetype plugin on
		"filetype indent on

