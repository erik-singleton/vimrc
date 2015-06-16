set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'bling/vim-airline'
Plugin 'gmarik/Vundle.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'mbbill/undotree'
Plugin 'mileszs/ack.vim'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Color schemes
Plugin 'croaker/mustang-vim'

call vundle#end()

filetype plugin indent on

syntax on
set shell=/bin/sh
set t_Co=256
set guifont=Inconsolata\ for\ Powerline\ 12
set nu
set showmatch
set smarttab
set tabstop=2
set shiftwidth=2
set expandtab
set encoding=utf-8

" Set persistent undos and hide buffers by default when switching them
set hidden
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

set ignorecase
set smartcase
set hlsearch
set incsearch

colorscheme mustang

map <leader>t :NERDTreeToggle<CR>
map <leader>u :UndotreeToggle<CR>
map <C-b> :NERDTreeFind<CR><C-w>l
map g> :bnext!<CR>
map g< :bprev!<CR>
map gl :bnext!<CR>
map gh :bprev!<CR>
map gd :bprev!\|bd #<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:buffergator_suppress_keymaps = 1

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

vmap "+y :!xclip -f -sel clip
map "+p :r!xclip -o -sel clip
