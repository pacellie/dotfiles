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
Plugin 'jiangmiao/auto-pairs'               "better ({[ ...
Plugin 'ntpeters/vim-better-whitespace'     "manage whitespace
Plugin 'ervandew/supertab'                  "insert completions with TAB
Plugin 'kien/ctrlp.vim'                     "fuzzy file search

" Styling
Plugin 'vim-airline/vim-airline'    	    "airline
Plugin 'vim-airline/vim-airline-themes'	    "airline themes'
Plugin 'chriskempson/base16-vim'            "colorschemes

" Linting and Autocomplete
Plugin 'scrooloose/syntastic'               "syntastic syntax checker
Plugin 'valloric/youcompleteme'             "autocomplete

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
set clipboard=unnamedplus
" }}}

" Colors {{{
let base16colorspace=256                "Access colors present in 256 colorspace
syntax enable	         		              "enable syntax processing
colorscheme base16-material
highlight Search ctermfg=15
" }}}

" Spaces & Tabs {{{
set tabstop=2					"number of visual spaces per TAB
set softtabstop=2			"number of spaces in TAB when editing
set shiftwidth=2			"indenting is 4 spaces
set textwidth=100     "text width
set smarttab
set expandtab					"TABS are spaces
set autoindent				"turn indenting on
set smartindent
" }}}

" UI Config {{{
set number				   "show line numbers
set relativenumber	 "show relative line numbers
set wildmenu				 "visual autocomplete for command menu
set showcmd					 "what command am i typing
set showmatch				 "show matching brackets while hover
set scrolloff=4      "keep at least 4 lines below cursor
" }}}

" Searching {{{
set incsearch					"search as characters are entered
set hlsearch					"highlight matches
set ignorecase			  "ignore case when matching
" }}}

" Folding {{{
set foldenable				    "enable folding
set foldlevelstart=99			"start files completely unfolded
set foldmethod=indent			"fold based on indentation
set foldlevel=99          "max fold level
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
set laststatus=2                             "show statusline all the time
let g:airline#extendsions#tabline#enabled=1
" }}}

" Better Whitespace {{{
autocmd BufWritePre * StripWhitespace
" }}}

" Leader Shortcuts {{{
let maplocalleader=","    	    "set leader
" }}}

" CtrlP {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" }}}

" Latex {{{
au BufNewFile,BufRead *.tex set autoindent&
au BufNewFile,BufRead *.tex set cindent&
au BufNewFile,BufRead *.tex set smartindent&
au BufNewFile,BufRead *.tex set indentexpr&
nmap <F7> :LatexPreview<CR>
let g:tex_conceal = ''
" }}}

" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:Syntastic_aggregate_errors = 1
let g:Syntastic_aggregate_errors = 1

nnoremap <C-n> :lnext<CR>
nnoremap <C-p> :lprev<CR>
nnoremap <C-e> :SyntasticCheck<CR>
nnoremap <C-c> :lclose<CR>
nnoremap <C-t> :SyntasticToggleMode<CR>
" }}}

" YouCompleteMe {{{
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \   'haskll' : ['.'],
  \ }
" }}}

" vim:foldmethod=marker
