" Automatically setup Vundle on first run
if !isdirectory(expand("~/.vim/bundle"))
    call system("git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim")
endif

set nocompatible " Be IMproved

" Vundle
filetype off " Required by Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ryanss/vim-hackernews'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/syntastic'

" Prefers local node_modules/eslint for syntastic
Plugin 'mtscout6/syntastic-local-eslint.vim'

" Requires custom shell colors or iTerm colors from https://github.com/chriskempson/base16-iterm2
Plugin 'chriskempson/base16-vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pangloss/vim-javascript'
Plugin 'raichoo/purescript-vim'
Plugin 'FrigoEU/psc-ide-vim'
Plugin 'tomlion/vim-solidity'
Plugin 'nvie/vim-flake8'
Plugin 'JamshedVesuna/vim-markdown-preview'

call vundle#end()

" markdown preview options
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Firefox'

" Automatically install bundles on first run
if !isdirectory(expand("~/.vim/bundle/syntastic"))
    execute 'silent PluginInstall'
    execute 'silent q'
endif

syntax on
filetype plugin indent on       " Sets indent mode based on filetype
syntax enable
set background=dark
colorscheme base16-tomorrow     " Default color scheme
highlight LineNr   ctermfg=darkgrey ctermbg=black

set clipboard=unnamed           " Share OS clipboard
set encoding=utf-8              " default character encoding
set hidden                      " do not unload buffers that get hidden

set wrap                        " Wrap lines visually
set number                      " Show line numbers
set scrolloff=3                 " keep minimal number of lines above/below cursor
set splitright                  " open vertical split right of current window
set sidescroll=3                " scroll sideways 3 characters at a time
set textwidth=0                 " Maximum line text width
set colorcolumn=120             " show max line-width

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

" Leader key
let mapleader = ","
let g:mapleader = ","
let g:user_emmet_leader_key = '<C-e>'

map <tab> :bn<cr>               " Next buffer
map <S-tab> :bp<cr>             " Previous buffer
map <S-q> :bd<cr>               " Close buffer

set mouse=a                     " Allow mouse usage in terminal

set showmatch                   " Briefly jump to matching bracket
set ignorecase                  " Ignore case when pattern matching
set smartcase                   " Only if all characters are lower case
set incsearch                   " Highlight matches while typing search
set hlsearch                    " Keep previous search highlighted

" Use same pane split character as tmux
set fillchars+=vert:│

" Do not create swap files
set nobackup
set nowritebackup
set noswapfile

" CtrlP
set rtp+=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = ''
nmap <Leader>p :CtrlP<CR>

" Ignore certain things
set wildignore+=output,dist,bower_components,build,.git,node_modules,_book

" Press <esc> to clear previous search highlight
nnoremap <Leader>c :noh<CR>

" map region expansion to v
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Easier split-pane navigation
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-k> :wincmd k<CR>

" Git/fugitive shortcuts
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gf <C-W>h<C-W>czR
nnoremap <Leader>gp :Git push<CR>

" Mappings for misc plugins
map <SPACE> <Plug>(easymotion-s2)
map <Leader>a <Plug>(EasyAlign)

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
let g:airline_skip_empty_sections = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_debug = 3

" Python
let python_highlight_all=1

" PureScript
au FileType purescript nmap <leader>t :PSCIDEtype<CR>
au FileType purescript nmap <leader>s :PSCIDEapplySuggestion<CR>
au FileType purescript nmap <leader>a :PSCIDEaddTypeAnnotation<CR>
au FileType purescript nmap <leader>i :PSCIDEimportIdentifier<CR>
au FileType purescript nmap <leader>qd :PSCIDEremoveImportQualifications<CR>
au FileType purescript nmap <leader>qa :PSCIDEaddImportQualifications<CR>

let g:purescript_indent_if = 0
let g:purescript_indent_case = 0
let g:purescript_indent_let = 0
let g:purescript_indent_where = 0
let g:purescript_indent_do = 0

let g:psc_ide_syntastic_mode = 1
