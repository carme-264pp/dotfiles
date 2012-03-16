set nocompatible

" edit
"---------------
set autoindent
set smartindent
set cindent
set backspace=indent,eol,start
set clipboard=unnamed
set pastetoggle=<F12> " ペースト時にインデントを行わない
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp

" indent
"---------------
set tabstop=4
set noexpandtab " スペースでインデントを入れない
set smarttab
set shiftwidth=4
set shiftround
set nowrap

" tab
"---------------
set showtabline=2
nnoremap <C-j> gT
nnoremap <C-k> gt

" display
"---------------
set number " 行番号表示
set ruler  " ルーラー表示
set list   " タブやEOLを表示
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%  " 非視覚文字表示
set title  " 編集中のファイル名表示
set showmode " モード表示
set laststatus=2 " ステータス行設定
set cmdheight=2 " コマンド行設定
set statusline=%t\ %m%r[%<%{fnamemodify(getcwd(),':~')}]%=%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}[%3l,%3c,%5P]
set linespace=0
set mouse=nv " マウス設定有効
set wildmenu
set wildmode=list:longest,full
set showmatch " 対括弧の表示
set showcmd

" search
"---------------
set hlsearch
"Escの2回押しでハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" syntax color
"---------------
syntax on
colorscheme ron
highlight Linenr ctermfg=grey
highlight StatusLine ctermfg=grey
highlight StatusLineNC ctermfg=white

" backup
" --------------------
set backup
set backupdir=~/.vim/vim_backup
set swapfile
set directory=~/.vim/vim_swap

" ------------------------------------------------
" Vundle Plugin
" > http://github.com/gmarik/vundle/
" ------------------------------------------------
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'
Bundle 'tpope/vim-fugitive'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'mattn/zencoding-vim'
Bundle 'Shougo/vinarise'
"Bundle 'hallettj/jslint.vim'

" vim-scripts repos
Bundle 'IndentAnything'
Bundle 'taglist.vim'
Bundle 'JavaScript-syntax'
Bundle 'Javascript-Indentation'
" Bundle 'AutoComplPop'
" Bundle 'L9' " Use AutoComplPop
Bundle 'snipMate'

filetype plugin indent on     " required! 

" ------------------------------------------------
" neocomplcache
" > https://github.com/Shougo/neocomplcache
" ------------------------------------------------
" Disable AutoComplPop
let g:acp_enableAtStartup = 0
" Use neocomplcache
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*snipMate\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ }

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" ------------------------------------------------
" Unite.vim
" > https://github.com/Shougo/unite.vim
" ------------------------------------------------
nnoremap <C-u> :Unite<SPACE>
let g:unite_enable_start_insert=1
noremap <C-p> :Unite buffer<CR>
noremap <C-o> :Unite -buffer-name=files file file_rec/async file/new<CR>
noremap <C-a> :Unite file_mru<CR>
noremap <C-u>w :Unite -auto-resize -buffer-name=window_tab window tab<CR>
noremap <C-u>l :Unite -auto-resize session<CR>
augroup Unite
  autocmd!
  autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
  autocmd FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
  autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
  autocmd FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
  autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-H> unite#do_action('tabopen')
  autocmd FileType unite inoremap <silent> <buffer> <expr> <C-H> unite#do_action('tabopen')
  autocmd FileType unite nnoremap <silent> <buffer> <C-c> :q<CR>
  autocmd FileType unite inoremap <silent> <buffer> <C-c> <ESC>
augroup END

" ------------------------------------------------
" ZenCoding.vim
" > https://github.com/mattn/zencoding-vim
" ------------------------------------------------
let g:user_zen_settings = {
			\ 'lang': 'ja',
			\ 'html': {
			\    'indentation': '  ',
			\   },
			\ 'php': {
			\    'indentation': '  ',
			\    'extends': 'html',
			\    'filters': 'html,c',
			\   },
			\ }
let g:use_zen_complete_tag = 1

" ------------------------------------------------
" .h作成時におまじないを自動挿入
" ------------------------------------------------
au BufNewFile *.h call IncludeGuard()
function! IncludeGuard()
	let fl = getline(1)
	if fl =~ "^#if"
		return
	endif
	let gatename = substitute(toupper(expand("%:t")), "??.", "_", "g")
	normal! gg
	execute "normal! i#ifndef " . gatename[0 : strlen(gatename) -3 ] . "_H_INCLUDED"
	execute "normal! o#define " . gatename[0 : strlen(gatename) -3 ] .  "_H_INCLUDED"
	execute "normal! Go#endif   /* " . gatename[0 : strlen(gatename) -3 ]  . "_H_INCLUDED */"
	4
endfunction

" ------------------------------------------------
" commentout.vim
" > http://nanasi.jp/articles/vim/commentout_source.html
" ------------------------------------------------
" lhs comments
vmap ,# :s/^/#/<CR>:nohlsearch<CR>
vmap ,/ :s/^/\/\//<CR>:nohlsearch<CR>
vmap ,> :s/^/> /<CR>:nohlsearch<CR>
vmap ," :s/^/\"/<CR>:nohlsearch<CR>
vmap ,% :s/^/%/<CR>:nohlsearch<CR>
vmap ,! :s/^/!/<CR>:nohlsearch<CR>
vmap ,; :s/^/;/<CR>:nohlsearch<CR>
vmap ,- :s/^/--/<CR>:nohlsearch<CR>
vmap ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

" wrapping comments
vmap ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>
vmap ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>:nohlsearch<CR>
vmap ,< :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>
vmap ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:nohlsearch<CR>

" block comments
vmap ,b v`<I<CR><esc>k0i/*<ESC>`>j0i*/<CR><esc><ESC>
vmap ,h v`<I<CR><esc>k0i<!--<ESC>`>j0i--><CR><esc><ESC>
