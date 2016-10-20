"Vundle configuration START

set nocompatible
filetype plugin indent off

"include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

"INSERT PLUGINS HERE

"to install a plugin add it here and run   :PluginInstall
"to update the plugins run                 :PluginUpdate
"to delete a plugin remove it here and run :PluginClean

"tpope-surround
Plugin 'tpope/vim-surround'

"nerdtree
Plugin 'scrooloose/nerdtree'

"airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"theme 
Plugin 'lifepillar/vim-solarized8'

"END PLUGINS

call vundle#end()
filetype plugin indent on

"Vundle configuration END

"enable filetype plugins and syntax after vundle is finished
filetype plugin indent on
syntax on

"line numbers
set number
set relativenumber

"airline settings
set laststatus=2 "show statusline all the time
let g:airline#extendsions#tabline#enabled=1
let g:airline_theme='solarized'

"gvim options
set guioptions-=m "hide menu bar
set guioptions-=T "hide toolbar
set guioptions-=r "hide right scroll bar
set guioptions-=L "hide left scroll bar

"theme
colorscheme solarized8_light
set guifont=Monospace\ 12

"enable folding
set foldmethod=indent
