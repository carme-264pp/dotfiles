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
set undodir=~/.vim/vim_undo

" ------------------------------------------------
" dein Plugin
" > https://github.com/Shougo/dein.vim/
" ------------------------------------------------
if &compatible
	set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.cache/dein'))

call dein#add('Shougo/vimproc', {'build': 'make'})

" My Bundles here:
"
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/unite-session')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('honza/vim-snippets')

" useful tool plugins
call dein#add('Shougo/vimshell')
call dein#add('tpope/vim-fugitive')
call dein#add('thinca/vim-ref')
call dein#add('thinca/vim-quickrun')
call dein#add('mattn/emmet-vim')
call dein#add('Shougo/vinarise')
call dein#add('itchyny/lightline.vim')
call dein#add('itchyny/thumbnail.vim')

" assists
" call dein#add('taglist.vim')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('jelera/vim-javascript-syntax')
" call dein#add('pangloss/vim-javascript')
" call dein#add('teramako/jscomplete-vim')
call dein#add('petRUShka/vim-opencl')
call dein#add('derekwyatt/vim-scala')

" Required:
call dein#end()

filetype plugin indent on
syntax enable

" ------------------------------------------------
" lightline.vim
" > https://github.com/itchyny/lightline.vim
" ------------------------------------------------
let g:lightline = {
		\ 'colorscheme': 'solarized',
	\ }

" ------------------------------------------------
" Thumbnail.vim
" > https://github.com/itchyny/thumbnail.vim
" ------------------------------------------------
noremap <Nul> :Thumbnail<CR>
augroup ThumbnailKey
	autocmd!
	autocmd FileType thumbnail nmap <buffer> <C-c>
		\ <Plug>(thumbnail_exit_visual)
augroup END

" ------------------------------------------------
" neocomplete.vim
" > https://github.com/Shougo/neocomplete.vim
" ------------------------------------------------
" Disable AutoComplPop
let g:acp_enableAtStartup = 0
" Use neocomplete
let g:neocomplete#enable_at_startup = 1
" Set data_directory
let g:neocomplete#data_directory = expand('~/.vim/neocon')
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
\ 'default' : '',
\ 'vimshell' : $HOME.'/.vimshell_hist',
\ }
if !exists('g:neocomplete#delimiter_patterns')
	let g:neocomplete#delimiter_patterns= {}
endif
let g:neocomplete#delimiter_patterns.vim = ['#']
let g:neocomplete#delimiter_patterns.cpp = ['::']

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplete#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? '\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete_omni_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" ------------------------------------------------
" neosnippet.vim
" > https://github.com/Shougo/neosnippet.vim
" ------------------------------------------------
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
	set conceallevel=2 concealcursor=i
endif

let g:neosnippet#snippets_directory = expand('~/.vim/bundle/vim-snippets/snippets')
let g:neosnippet#data_directory = expand('~/.vim/neosnippet')

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" ------------------------------------------------
" Unite.vim
" > https://github.com/Shougo/unite.vim
" ------------------------------------------------
let g:unite_data_directory = expand('~/.vim/unite')
nnoremap <C-u> :Unite<SPACE>
let g:unite_enable_start_insert=1
noremap <C-p> :Unite buffer<CR>
noremap <C-o> :Unite -buffer-name=files file file/new<CR>
noremap <C-i> :Unite file_mru<CR>
noremap <C-u>w :Unite -auto-resize -buffer-name=window_tab window:no-current tab:no-current<CR>
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

" unite-session
let g:unite_source_session_path = expand('~/.vim/unite-session')

" neomru
let g:neomru#directory_mru_path = expand('~/.vim/neomru/directory')
let g:neomru#file_mru_path = expand('~/.vim/neomru/file')

" ------------------------------------------------
" vimshell.vim
" ------------------------------------------------
let g:vimshell_temporary_directory = expand('~/.vim/vimshell')
" let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt_expr = 'fnamemodify(getcwd(), ":~")." > "'
let g:vimshell_prompt_pattern = '^\f\+ > '

autocmd FileType vimshell
\ call vimshell#altercmd#define('g', 'git')
\| call vimshell#altercmd#define('l', 'ls')
\| call vimshell#altercmd#define('ll', 'ls -l')
\| call vimshell#altercmd#define('la', 'ls -a')
\| call vimshell#altercmd#define('lla', 'ls -al')

" ------------------------------------------------
" vim-ref.vim
" ------------------------------------------------
let g:ref_cache_dir = expand('~/.vim/vim_ref_cache')

" ------------------------------------------------
" emmet-vim
" > https://github.com/mattn/emmet-vim
" ------------------------------------------------
let g:user_emmet_settings = {
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
let g:use_emmet_complete_tag = 1

" ------------------------------------------------
" quickrun.vim
" ------------------------------------------------
let g:quickrun_config = {
			\ "_" : {
			\	"outputter/buffer/into": 1,
			\	"outputter/buffer/split": ":botright",
			\	"outputter/buffer/running_mark": "running...",
			\	"runner": "vimproc",
			\	"runner/vimproc/updatetime": 40
			\ }
			\}
let g:quickrun_config.cpp = {
			\	"type": "cpp/g++"
			\}

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
