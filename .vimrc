set nocompatible

" key assign
"---------------
:abbr #b /******************************************
:abbr #e ******************************************/

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
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp

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
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set linespace=0
set mouse=nv " マウス設定有効
set wildmenu
set wildmode=list:longest,full
set showmatch " 対括弧の表示
set showcmd

" search
"---------------
set hlsearch

" syntax color
"---------------
syntax on
colorscheme ron
highlight Linenr ctermfg=darkgrey

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
Bundle 'tpope/vim-fugitive'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'hallettj/jslint.vim'

" vim-scripts repos
Bundle 'IndentAnything'
Bundle 'ZenCoding.vim'
" Bundle 'AutoComplPop'
" Bundle 'L9' " Use AutoComplPop
Bundle 'snipMate'

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required! 

" ------------------------------------------------
" neocomplcache
" > https://github.com/Shougo/neocomplcache
" ------------------------------------------------
" Disable AutoComplPop
let g:acp_enableAtStartup = 0
" use neocomplcache1
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
noremap <C-o> :Unite -buffer-name=file file<CR>
noremap <C-a> :Unite file_mru<CR>
augroup Unite
  autocmd!
  autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
  autocmd FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
  autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
  autocmd FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
  autocmd FileType unite nnoremap <silent> <buffer> <C-c> :q<CR>
  autocmd FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
  autocmd FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
augroup END

" ------------------------------------------------
" encoding
" > http://www.kawaz.jp/pukiwiki/?vim#cb691f26
" ------------------------------------------------
" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

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
