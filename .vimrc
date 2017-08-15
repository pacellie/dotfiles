" \u1234
" Plugins {{{
"VUNDLE CONFIGURATION START

set nocompatible
filetype plugin indent off
"include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

"INSERT PLUGINS BELOW

"to install a plugin add it here and run   :PluginInstall
"to update the plugins run                 :PluginUpdate
"to delete a plugin remove it here and run :PluginClean

" Movement and Editing
Plugin 'tpope/vim-surround'	    	    	"surround
Plugin 'tpope/vim-commentary'               "commentary
Plugin 'tpope/vim-repeat'                   "repeat surround and commentary cmds
Plugin 'easymotion/vim-easymotion'          "jump around faster
Plugin 'yggdroot/indentline'                "indent markers
Plugin 'jiangmiao/auto-pairs'               "better ({[ ...
Plugin 'ntpeters/vim-better-whitespace'     "manage whitespace
Plugin 'ervandew/supertab'                  "insert completions with TAB
Plugin 'majutsushi/tagbar'                  "tagbar
Plugin 'kien/ctrlp.vim'                     "fuzzy file search

" Styling
Plugin 'vim-airline/vim-airline'    		"airline
Plugin 'vim-airline/vim-airline-themes'	    "airline themes'
Plugin 'chriskempson/base16-vim'            "colorschemes

" Linting and Autocomplete
Plugin 'scrooloose/syntastic'               "sntastic syntax checker
Plugin 'valloric/youcompleteme'             "autocomplete

"Markdown and Latex
Plugin 'suan/vim-instant-markdown'          "markdown preview
Plugin 'alxhnr/latex_preview'               "latex preview

" Haskell
Plugin 'eagletmt/ghcmod-vim'                "haskell background checking
Plugin 'eagletmt/neco-ghc'                  "haskell autocomplete
Plugin 'Shougo/vimproc.vim'                 "haskell helper
Plugin 'godlygeek/tabular'                  "haskell lining up
Plugin 'nbouscal/vim-stylish-haskell'       "format haskell files on save

"END PLUGINS

call vundle#end()
"enable filetype plugins vundle is finished
filetype plugin indent on

"VUNDLE CONFIGURATION END
" }}}

" General {{{
autocmd! bufwritepost .vimrc source %   "reload .vimrc on save
set hidden                              "allow buffer change w/o saving
set modelines=1                         "enable modelines
set encoding=utf-8                      "fileencodeing
set fileencoding=utf-8
set fileformat=unix
set timeoutlen=1000                     "faster mode switching
set ttimeoutlen=0
set clipboard=unnamed                   "enable easier copy paste
" }}}

" Colors {{{
let base16colorspace=256                "Access colors present in 256 colorspace
syntax enable			        		"enable syntax processing
colorscheme base16-google-light
highlight Search ctermfg=15
" }}}

" Spaces & Tabs {{{
set tabstop=4					"number of visual spaces per TAB
set softtabstop=4				"number of spaces in TAB when editing
set shiftwidth=4				"indenting is 4 spaces
set textwidth=79                "text width
set smarttab
set expandtab					"TABS are spaces
set autoindent					"turn indenting on
set smartindent
" }}}

" UI Config {{{
set number				    	"show line numbers
set relativenumber				"show relative line numbers
set wildmenu					"visual autocomplete for command menu
set showcmd					    "what command am i typing
set showmatch					"show matching brackets while hover
set scrolloff=4                 "keep at least 4 lines below cursor
" }}}

" Searching {{{
set incsearch					"search as characters are entered
set hlsearch					"highlight matches
set ignorecase					"ignore case when matching
" }}}

" Folding {{{
set foldenable				    "enable folding
set foldlevelstart=99			"start files completely unfolded
set foldmethod=indent			"fold based on indentation
set foldlevel=99                "max fold level
" }}}

" Mappings {{{
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

vnoremap gs :sort<CR>
vnoremap < <gv
vnoremap > >gv
" }}}

" Airline Settings {{{
set laststatus=2                "show statusline all the time
let g:airline#extendsions#tabline#enabled=1
" }}}

" Better Whitespace {{{
autocmd BufWritePre * StripWhitespace
" }}}

" Leader Shortcuts {{{
let mapleader="\<cr>"    	    "set leader
" }}}

" Tagbar {{{
nmap <F8> :TagbarToggle<CR>
" }}}

" CtrlP {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" }}}

" Latex {{{
nmap <F7> :LatexPreview<CR>
let g:tex_conceal = ''
" }}}

" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nnoremap <C-n> :lnext<CR>
nnoremap <C-p> :lprev<CR>
nnoremap <C-c> :lclose<CR>

let g:syntastic_haskell_checkers = ['ghcmod', 'hdevtools', 'hlint']
let g:syntastic_python_checkers = ['pylint', 'pep8', 'flake8']
" }}}

" Haskell {{{
au BufNewFile,BufRead *.hs set tabstop=2
au BufNewFile,BufRead *.hs set softtabstop=2
au BufNewFile,BufRead *.hs set shiftwidth=2
au BufNewFile,BufRead *.hs set filetype=haskell

" autocomplete
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:necoghc_use_stack = 1
let g:ycm_semantic_triggers = {'haskell' : ['.']}

" remapping for ghcmod
map <silent> gmc :GhcModCheck<CR>
map <silent> gmI :GhcModInfo<CR>
map <silent> gml :GhcModLint<CR>
map <silent> gmt :GhcModType<CR>
map <silent> gmtc :GhcModTypeClear<CR>

" lining up =, ::, ->
let g:haskell_tabular=1
vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

" hasktags for tagbar
let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
        \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }
" }}}

" Python {{{
map <silent> gpl :SyntasticCheck pylint<CR>
map <silent> gp8 :SyntasticCheck pep8<CR>
map <silent> gf8 :SyntasticCheck flake8<CR>
" }}}

" vim:foldmethod=marker
