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
Plugin 'scrooloose/nerdtree'			    "nerdtree
Plugin 'ntpeters/vim-better-whitespace'     "manage whitespace
Plugin 'yggdroot/indentline'                "indent markers
Plugin 'jiangmiao/auto-pairs'               "better ({[ ...
Plugin 'vim-airline/vim-airline'    		"airline
Plugin 'vim-airline/vim-airline-themes'	    "airline themes'
Plugin 'chriskempson/base16-vim'            "colorschemes
Plugin 'scrooloose/syntastic'               "sntastic syntax checker
Plugin 'Valloric/YouCompleteMe'             "autocompletion
Plugin 'fatih/vim-go'                       "vim golang support
Plugin 'ervandew/supertab'                  "insert completions with TAB
Plugin 'suan/vim-instant-markdown'          "markdown preview
Plugin 'tmhedberg/SimpylFold'               "better python codefolding
Plugin 'eagletmt/ghcmod-vim'                "haskell background checking
Plugin 'eagletmt/neco-ghc'                  "haskell autocomplete
Plugin 'Shougo/vimproc.vim'                 "haskell helper

"END PLUGINS

call vundle#end()
filetype plugin indent on

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
" }}}

" GVim {{{
if has("gui_running")
    set guioptions-=m				"hide menu bar
    set guioptions-=T 				"hide toolbar
    set guioptions-=r 				"hide right scroll bar
    set guioptions-=L 				"hide left scroll bar
    set guifont=Monospace\ 11		"set font-family and font-size
endif
" }}}

" Airline Settings {{{
set laststatus=2                            "show statusline all the time
let g:airline#extendsions#tabline#enabled=1
" }}}

" Better Whitespace {{{
autocmd BufWritePre * StripWhitespace
" }}}

" Leader Shortcuts {{{
let mapleader="\<space>"        	    "set leader
nnoremap <leader>h :noh<CR>
nnoremap <leader>n :NERDTree<CR>
" }}}

" Opam Merlin Ocaml {{{
let g:opamshare = substitute(system('opam config var share'), '\n$', '', '''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
" }}}

" YouCompleteMe{{{
let g:ycm_autoclose_preview_window_after_completion=1           "go away autocomplete window when done
let g:ycm_semantic_triggers = {'haskell' : ['.']}               "enable haskell autocomplete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
" }}}

" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_haskell_checkers = ['ghcmod', 'hdevtools', 'hlint']
" }}}

" Python {{{
au BufNewFile,BufRead *.py          "PEP8
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4

" python with virtual env
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1          "make it pretty
" }}}

" Haskell {{{
au BufNewFile,BufRead *.hs          "Haskell indentation
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
    \ set filetype=haskell

" remapping for ghcmod
map <silent> gmc :GhcModCheck<CR>
map <silent> gmI :GhcModInfo<CR>
map <silent> gml :GhcModLint<CR>
map <silent> gmt :GhcModType<CR>
map <silent> gmtc :GhcModTypeClear<CR>

" }}}

" vim:foldmethod=marker
