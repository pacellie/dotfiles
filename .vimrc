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

" Javascript, Html, Css
Plugin 'mattn/emmet-vim'                    "emmet
Plugin 'othree/html5.vim'                   "html5
Plugin 'hail2u/vim-css3-syntax'             "css3
Plugin 'elzr/vim-json'                      "json
Plugin 'pangloss/vim-Javascript'            "javascript
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'beautify-web/js-beautify'
Plugin 'marijnh/tern_for_vim'

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
nnoremap <C-c> :lclose<CR>
nnoremap <C-t> :SyntasticToggleMode<CR>

let g:syntastic_haskell_checkers = ['ghcmod', 'hdevtools', 'hlint']
let g:syntastic_python_checkers = ['pylint', 'flake8', 'pep8']
let g:syntastic_javascript_checkers = ['jshint', 'jslint', 'eslint']
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
" }}}

" Python {{{
map <silent> gpl :SyntasticCheck pylint<CR>
map <silent> gp8 :SyntasticCheck pep8<CR>
map <silent> gf8 :SyntasticCheck flake8<CR>
" }}}

" Javascript, Html, Css {{{
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

au BufNewFile,BufRead *.json set filetype=json

map <silent> gtd :TernDef<CR>
map <silent> gtD :TernDoc<CR>
map <silent> gtt :TernType<CR>
map <silent> gtr :TernRefs<CR>
map <silent> gtR :TernRename<CR>

" }}}

" vim:foldmethod=marker
