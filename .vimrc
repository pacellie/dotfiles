let mapleader=","				"set leader to ,
" :set foldmethod=marker ... :set foldmethod=indent

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

Plugin 'tpope/vim-surround'	    		"tpope-surround
Plugin 'scrooloose/nerdtree'			"nerdtree
Plugin 'vim-airline/vim-airline'		"airline
Plugin 'vim-airline/vim-airline-themes'	"airline themes
Plugin 'lifepillar/vim-solarized8'		"theme 

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
" }}}

" Colors {{{
syntax enable			        		"enable syntax processing 
colorscheme solarized8_light			"solarized color theme 
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
nnoremap j gj					"move vertically by visual line
nnoremap k gk
nnoremap B ^    				"move to beginning/end of line
nnoremap E $
nnoremap $ <nop>				"$/^ doesn't do anything
nnoremap ^ <nop> 
" }}}	

" GVim {{{
set guioptions-=m				"hide menu bar
set guioptions-=T 				"hide toolbar
set guioptions-=r 				"hide right scroll bar
set guioptions-=L 				"hide left scroll bar
set guifont=Monospace\ 12		"set font-family and font-size
" }}}	

" Airline Settings {{{
set laststatus=2                            "show statusline all the time
let g:airline#extendsions#tabline#enabled=1
let g:airline_theme='solarized'
" }}}

" vim:foldmethod=marker
