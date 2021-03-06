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
" NERDTree
"-------------------------------------------------
" マウス操作方法
" 1 : ファイル、ディレクトリ両方共ダブルクリックで開く
" 2 : ディレクトリのみシングルクリックで開く
" 3 : ファイル、ディレクトリ両方共シングルクリックで開く
let g:NERDTreeMouseMode=3

" <C-e>でNERDTreeをオンオフ いつでもどこでも
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>

" 引数なしでvimを開いたらNERDTreeを起動、
" 引数ありならNERDTreeは起動しない、引数で渡されたファイルを開く
autocmd vimenter * if !argc() | NERDTree | endif
" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 無視するファイルを設定する
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
" 隠しファイルを表示するか
let g:NERDTreeShowHidden=0
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


""""""""""""""""""""""""""""""
" Unit.vimの設定
"""""""""""""""""""""""""""""""
 " 入力モードで開始する
 let g:unite_enable_start_insert=1
 " バッファ一覧
 noremap <C-P> :Unite buffer<CR>
 " ファイル一覧
 noremap <C-N> :Unite -buffer-name=file file<CR>
 " 最近使ったファイルの一覧
 noremap <C-Z> :Unite file_mru<CR>
 " sourcesを「今開いているファイルのディレクトリ」とする
 noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
 " ウィンドウを分割して開く
 "au FileType unite nnoremap <silent> <buffer> <expr> <C-J>
 "unite#do_action('split')
 "au FileType unite inoremap <silent> <buffer> <expr> <C-J>
 "unite#do_action('split')
 " ウィンドウを縦に分割して開く
 "au FileType unite nnoremap <silent> <buffer> <expr> <C-K>
 "unite#do_action('vsplit')
 "au FileType unite inoremap <silent> <buffer> <expr> <C-K>
 "unite#do_action('vsplit')
 " ESCキーを2回押すと終了する
 au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
 au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
 """"""""""""""""""""""""""""""

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
        NeoBundle 'Shougo/unite.vim' " ファイルオープンを便利に
        NeoBundle 'Shougo/neomru.vim' " Unite.vimで最近使ったファイルを表示できるようにする
        NeoBundle 'scrooloose/nerdtree'


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

colorscheme railscasts
