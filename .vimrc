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

Plugin 'tpope/vim-surround'	    	    	"surround
Plugin 'tpope/vim-commentary'               "commentary
Plugin 'tpope/vim-repeat'                   "repeat surround and commentary cmds
Plugin 'ntpeters/vim-better-whitespace'     "manage whitespace
Plugin 'yggdroot/indentline'                "indent markers
Plugin 'jiangmiao/auto-pairs'               "better ({[ ...
Plugin 'vim-airline/vim-airline'    		"airline
Plugin 'vim-airline/vim-airline-themes'	    "airline themes'
Plugin 'chriskempson/base16-vim'            "colorschemes
Plugin 'scrooloose/syntastic'               "sntastic syntax checker
Plugin 'Valloric/YouCompleteMe'             "autocompletion
Plugin 'ervandew/supertab'                  "insert completions with TAB
Plugin 'suan/vim-instant-markdown'          "markdown preview
Plugin 'eagletmt/ghcmod-vim'                "haskell background checking
Plugin 'eagletmt/neco-ghc'                  "haskell autocomplete
Plugin 'Shougo/vimproc.vim'                 "haskell helper
Plugin 'godlygeek/tabular'                  "haskell lining up

"END PLUGINS

call vundle#end()
"enable filetype plugins vundle is finished
filetype plugin indent on

"VUNDLE CONFIGURATION END
" }}}

" General {{{
set hidden                      "allow buffer change w/o saving
set modelines=1                 "enable modelines
set encoding=utf-8              "fileencodeing
set fileencoding=utf-8
set fileformat=unix
set timeoutlen=1000             "faster mode switching
set ttimeoutlen=0
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
set foldenable					    "enable folding
set foldlevelstart=0				"start files completely folded
set foldmethod=indent				"fold based on indentation
set foldlevel=99                    "max fold level
" }}}

" Movement {{{
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
" }}}

" Airline Settings {{{
set laststatus=2                            "show statusline all the time
let g:airline#extendsions#tabline#enabled=1
" }}}

" Better Whitespace {{{
autocmd BufWritePre * StripWhitespace
" }}}

" Leader Shortcuts {{{
let mapleader="\<cr>"        	    "set leader
nnoremap <leader>n :NERDTree<CR>
" }}}

" Opam Merlin Ocaml {{{
let g:opamshare = substitute(system('opam config var share'), '\n$', '', '''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
" }}}

" YouCompleteMe {{{
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_server_python_interpreter = 'python'
let g:ycm_autoclose_preview_window_after_completion=1           "go away autocomplete window when done
let g:ycm_semantic_triggers = {'haskell' : ['.']}               "enable haskell autocomplete
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

let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_haskell_checkers = ['ghcmod', 'hdevtools', 'hlint']
" }}}

" Python {{{
au BufNewFile,BufRead *.py set tabstop=4          "PEP8
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set filetype=python

" python with virtual env
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'), dict(__file__=activate_this))
    #execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1          "make it pretty
" }}}

" Haskell {{{
au BufNewFile,BufRead *.hs set tabstop=2
au BufNewFile,BufRead *.hs set softtabstop=2
au BufNewFile,BufRead *.hs set shiftwidth=2
au BufNewFile,BufRead *.hs set filetype=haskell
let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

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
" }}}

" vim:foldmethod=marker
