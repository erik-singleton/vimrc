set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'bling/vim-airline'
Plugin 'gmarik/Vundle.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'

" Color schemes
Plugin 'croaker/mustang-vim'

call vundle#end()

filetype plugin indent on

syntax on
set shell=/bin/sh
set t_Co=256
set guifont=Inconsolata\ 12
set nu
set showmatch
set smarttab
set tabstop=2
set shiftwidth=2
set expandtab

set ignorecase
set smartcase
set hlsearch
set incsearch

colorscheme mustang

map <leader>t :NERDTreeToggle<CR>
map g> :bnext!<CR>
map g< :bprev!<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:airline#extensions#tabline#enabled = 1

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


vmap "+y :!xclip -f -sel clip
map "+p :r!xclip -o -sel clip
