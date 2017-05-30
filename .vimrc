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
set encoding=utf-8
set fileencoding=utf-8
" }}}

" Colors {{{
let base16colorspace=256                "Access colors present in 256 colorspace
syntax enable			        		"enable syntax processing
colorscheme base16-google-light
" }}}

" Spaces & Tabs {{{
set tabstop=4					"number of visual spaces per TAB
set softtabstop=4				"number of spaces in TAB when editing
set expandtab					"TABS are spaces
set shiftwidth=4				"indenting is 4 spaces
set autoindent					"turn indenting on
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
    set guifont=Monospace\ 12		"set font-family and font-size
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
let mapleader="\<space>"        	    "set leader to ,
nnoremap <leader>h :noh<CR>
nnoremap <leader>n :NERDTree<CR>
" }}}

" Opam Merlin Ocaml {{{
let g:opamshare = substitute(system('opam config var share'), '\n$', '', '''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
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
let g:syntastic_python_checkers = ['pylint']
" }}}

" vim:foldmethod=marker
