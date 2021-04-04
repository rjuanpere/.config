" vim is not vi
set nocompatible

" vundle plugin manager
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'easymotion/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-unimpaired'

call vundle#end()
filetype plugin indent on

" allow local .vimrc
set exrc
set secure

" formatting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smarttab
set expandtab

" behaviour
set hidden
set backspace=indent,eol,start
set textwidth=80
set undofile
set undodir=~/.vimundo
set timeoutlen=1000
set ttimeoutlen=0

" appearance
set encoding=utf-8
set termencoding=utf-8
set term=screen-256color
set colorcolumn=80
set nowrap
set wildmenu
set cursorline
set number

" searching
set hlsearch
set incsearch
set showmatch
set smartcase
set ignorecase

" colors
syntax enable
set background=dark
colorscheme solarized

" specific filetype settings
au BufRead,BufNewFile *.md set filetype=markdown
autocmd FileType cmake setlocal expandtab softtabstop=2 shiftwidth=2

" key bindings
let mapleader = ","
"" disable highlights
map <silent> <leader><space> :nohl<CR>
"" remove trailing spaces
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" plugin: airline
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#whitespace#mixed_indent_algo=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S' }

" plugin: syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

nnoremap <Leader>sc :SyntasticCheck<CR>
nnoremap <Leader>sr :SyntasticReset<CR>
