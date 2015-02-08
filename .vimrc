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

" Use tmux for slime
let g:slime_target = "tmux"
" Sets indent mode based on filetype
filetype plugin indent on
" enable chicken scheme mode
let g:is_chicken=1
" Leader key
let mapleader = ","
" Share OS clipboard
set clipboard=unnamed
" Allow mouse usage in terminal
set mouse=a
" Show last status
set laststatus=2
" Show line numbers
set number
" Do not create swap files
set nobackup
set nowritebackup
set noswapfile
" Do not fold code
set nofoldenable
" Maximum line text width
set textwidth=80
" Wrap lines visually
set wrap
" Always show line/column number
set ruler
" Ignore certain things
set wildignore+=build,public/build,.git,node_modules,*/deps/go/*
" Colors!
colorscheme nazca
" Syntax highlighting
syntax on
" Indent automatically
set autoindent
" Set backspace to work for all characters
set backspace=indent,eol,start
" Default indentation and whitespace display
set list
set expandtab " Spaces for tabs
set tabstop=2 " 2 spaces for each tab
set shiftwidth=2 " 2 spaces for indentation
set listchars=tab:▸▸,trail:¬ " Show tab character and trailing characters
" PHP indentation uses spaces and 4 spaces for each tab per PSR guidelines
autocmd FileType php setlocal shiftwidth=4 tabstop=4 expandtab
" HTML indentation uses spaces and 4 spaces for each tab
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
" Go indentation uses tabs
autocmd FileType go setlocal shiftwidth=1 tabstop=3 noexpandtab
autocmd FileType go setlocal listchars=tab:\ \ ,trail:¬ " Show trailing chars
" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = ''
nmap <Leader>p :CtrlP<CR>
