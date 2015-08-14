" Automatically setup Vundle on first run
if !isdirectory(expand("~/.vim/bundle/vundle"))
    call system("git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle")
endif

set nocompatible " Be IMproved

" Vundle
filetype off " Required by Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'ryanss/vim-hackernews'
Bundle 'jpalardy/vim-slime'
Bundle 'kien/ctrlp.vim'
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
Bundle 'nanotech/jellybeans.vim'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'terryma/vim-expand-region'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'scrooloose/syntastic'

" Automatically install bundles on first run
if !isdirectory(expand("~/.vim/bundle/vim-airline"))
    execute 'silent BundleInstall'
    execute 'silent q'
endif

syntax on                       " Syntax highlighting
filetype plugin indent on       " Sets indent mode based on filetype
colorscheme jellybeans          " Default color scheme

set clipboard=unnamed           " Share OS clipboard
set encoding=utf-8              " default character encoding
set hidden                      " do not unload buffers that get hidden

set nowrap                      " Do not wrap lines visually
set number                      " Show line numbers
set scrolloff=3                 " keep minimal number of lines above/below cursor
set splitright                  " open vertical split right of current window
set sidescroll=3                " scroll sideways 3 characters at a time
set textwidth=80                " Maximum line text width

set foldmethod=indent           " Fold based on indent
set foldnestmax=3               " Deepest fold is 3 levels
set nofoldenable                " Dont fold by default

set showcmd                     " Show command line at bottom of screen
set laststatus=2                " Show last status
set visualbell                  " use visual bell instead of beeping

set autoindent                  " Indent automatically
set cindent                     " Syntax aware auto-indent
set backspace=indent,eol,start  " Set backspace to work for all characters

set expandtab                   " Spaces for tabs
set smarttab                    " <BS> deletes a shiftwidth worth of space
set tabstop=4                   " 2 spaces for each tab in file
set softtabstop=4               " 2 spaces for pressing tab key
set shiftwidth=4                " 2 spaces for indentation

" Use same pane split character as tmux
set fillchars+=vert:│

" Smaller indents on css and html files
autocmd Filetype css,html,javascript,json setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Leader key
let mapleader = ","
let g:mapleader = ","
let g:user_emmet_leader_key = '<C-e>'

set mouse=a                     " Allow mouse usage in terminal

set showmatch                   " Briefly jump to matching bracket
set ignorecase                  " Ignore case when pattern matching
set smartcase                   " Only if all characters are lower case
set incsearch                   " Highlight matches while typing search
set hlsearch                    " Keep previous search highlighted

let g:slime_target = "tmux"     " Use tmux for slime
let g:is_chicken=1              " enable chicken scheme mode

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

" Press <esc> to clear previous search highlight
nnoremap <Leader>s :noh<CR>

" map region expansion to v
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Easier split-pane navigation
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-k> :wincmd k<CR>

" tmux
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-g> :TmuxNavigatePrevious<cr>

" Git/fugitive shortcuts
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gf <C-W>h<C-W>czR
nnoremap <Leader>gp :Git push<CR>

" Mappings for misc plugins
map <SPACE> <Plug>(easymotion-s2)
map <Leader>a <Plug>(EasyAlign)

" Airline customizations
if !exists("g:airline_symbols")
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_section_y = airline#section#create(['%p', '%%'])
let g:airline_section_z = airline#section#create_right(['%l', '%c'])
let g:airline#extensions#syntastic#enabled = 1

" Closetag settings
let g:closetag_html_style=1
autocmd! FileType html,htmldjango source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

" Highlight characters when lines get too long
autocmd! BufWinEnter *.py,*.vim,vimrc match ErrorMsg '\%>79v.\+'
autocmd! BufWinEnter *.html match ErrorMsg '\%>100v.\+'

" Automatically wrap text while typing in Markdown and rST documents
autocmd! BufNewFile,BufReadPost *.md set filetype=markdown
autocmd! Filetype markdown,rst set textwidth=79

" Remove trailing whitespace and empty lines at end of file
augroup whitespace
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
    autocmd BufWritePre * :%s/\($\n\s*\)\+\%$//e
augroup END

" Syntastic
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_enable_signs = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
