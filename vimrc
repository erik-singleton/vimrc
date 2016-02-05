set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'bling/vim-airline'
Plugin 'digitaltoad/vim-jade'
Plugin 'gmarik/Vundle.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'mbbill/undotree'
Plugin 'mileszs/ack.vim'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'rust-lang/rust.vim'

" Color schemes
Plugin 'croaker/mustang-vim'

call vundle#end()

filetype plugin indent on

" Basic VIM settings
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

" Auto do things on file load and close
au BufRead,BufNewFile *.html set filetype=html.mustache syntax=mustache
autocmd BufWritePre * :call <SID>StripTrailingWhiteSpaces()

let g:alduin_Shout_Windhelm=1
colorscheme alduin

" Buffer keymap
nnoremap g> :bnext!<CR>
nnoremap g< :bprev!<CR>
nnoremap gl :bnext!<CR>
nnoremap gh :bprev!<CR>
nnoremap gd :bprev!\|bd #<CR>

" Clear highlight
nnoremap <leader>c :let @/=""<CR>

" DebugTimer plugin keys
nnoremap <leader>g :set operatorfunc=blockwrapper#BlockWrapper<cr>g@
vnoremap <leader>g :<c-u>call blockwrapper#BlockWrapper(visualmode())<cr>
vnoremap <leader>v :call blockwrapper#BlockIndividualWrapper()<cr>

" NERDTree settings
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <C-b> :NERDTreeFind<CR><C-w>l

" CtrlP settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = "node_modules"

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Buffergator settings
let g:buffergator_suppress_keymaps = 1

" Multiple Cursors settings
let g:multi_cursor_exit_from_insert_mode = 0

" Use Silver Searcher if available with :Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Strip all trailing whitespace
function! <SID>StripTrailingWhiteSpaces()
  let _s=@/
  let l = line(".")
  let c = col(".")

  %s/\s\+$//e

  let @/=_s
  call cursor(l, c)
endfun

" Use xclip to store things in " register
vmap "+y :!xclip -f -sel clip
map "+p :r!xclip -o -sel clip
