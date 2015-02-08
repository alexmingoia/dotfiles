" Automatically setup Vundle on first run
if !isdirectory(expand("~/.vim/bundle/vundle"))
    call system("git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle")
endif

set nocompatible " Be IMproved

" Recognize file types by extension
autocmd BufEnter *.php set filetype=php
autocmd BufEnter *.less set filetype=less
autocmd BufEnter *.js set filetype=javascript
autocmd BufEnter *.json set filetype=javascript
autocmd BufEnter *.ejs set filetype=html
autocmd BufEnter *.go set filetype=go

" Vundle
filetype off " Required by Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'jpalardy/vim-slime'
Bundle 'kien/ctrlp.vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-airline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'junegunn/vim-easy-align'
Bundle 'vim-scripts/closetag.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'vim-jp/cpp-vim'
Bundle 'fatih/vim-go'
Bundle 'othree/html5.vim'
Bundle 'StanAngeloff/php.vim'
Bundle 'tomasr/molokai'
Bundle 'jelera/vim-nazca-colorscheme'
Bundle 'nanotech/jellybeans.vim'

" Automatically install bundles on first run
if !isdirectory(expand("~/.vim/bundle/vim-airline"))
    execute 'silent BundleInstall'
    execute 'silent q'
endif

colorscheme nazca               " Colors!
let g:slime_target = "tmux"     " Use tmux for slime
filetype plugin indent on       " Sets indent mode based on filetype
syntax on                       " Syntax highlighting
set autoindent                  " Indent automatically
set backspace=indent,eol,start  " Set backspace to work for all characters
set list                        " Default indentation and whitespace display
set expandtab                   " Spaces for tabs
set tabstop=2                   " 2 spaces for each tab
set shiftwidth=2                " 2 spaces for indentation
set listchars=tab:▸▸,trail:¬    " Show tab character and trailing characters
let g:is_chicken=1              " enable chicken scheme mode
let mapleader = ","             " Leader key
set clipboard=unnamed           " Share OS clipboard
set mouse=a                     " Allow mouse usage in terminal
set laststatus=2                " Show last status
set number                      " Show line numbers
set nofoldenable                " Do not fold code
set textwidth=80                " Maximum line text width
set wrap                        " Wrap lines visually
set ruler                       " Always show line/column number

" Do not create swap files
set nobackup
set nowritebackup
set noswapfile

" Ignore certain things
set wildignore+=build,public/build,.git,node_modules,*/deps/go/*

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = ''
nmap <Leader>p :CtrlP<CR>
