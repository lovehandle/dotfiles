" ------------------------------------------------------------------------------
" Compatibility
" ------------------------------------------------------------------------------
set nocompatible
set modelines=0

" ------------------------------------------------------------------------------
" Theme 
" ------------------------------------------------------------------------------
set background=dark
set scrolloff=10
syntax on
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" ------------------------------------------------------------------------------
" Basics
" ------------------------------------------------------------------------------
let mapleader=","

set number
set cursorline
set laststatus=2
set showmode
set showcmd
set showmatch
set encoding=utf-8
set incsearch
set hlsearch
set ignorecase smartcase
set tabstop=2 softtabstop=2 shiftwidth=2 ai
set expandtab
set nobackup
set backspace=indent,eol,start
set nostartofline
set ruler

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
set wildmenu
set wildmode=longest,list

autocmd filetype c,cpp,java,ruby,js,css,sass,scss autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd filetype crontab setlocal nobackup nowritebackup

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable Arrow Keys
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Aliases
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <C-c> "*y

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand("~/.vimrc.plugs"))
  source ~/.vimrc.plugs
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Additional Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
