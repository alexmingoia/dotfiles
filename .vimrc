"let $NVIM_COC_LOG_LEVEL = 'debug'

" Automatically setup vim-plug on first run
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible " Be IMproved

" vim-plug
call plug#begin('~/.vim/plugged')

" Fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" Git wrapper for vim
Plug 'tpope/vim-fugitive'

" Syntax checking
Plug 'editorconfig/editorconfig-vim'

" Color scheme
Plug 'chriskempson/base16-vim'

" Status bar plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Language plugins
Plug 'pangloss/vim-javascript'
Plug 'neovimhaskell/haskell-vim'
Plug 'sdiehl/vim-ormolu' "Haskell Formatting
Plug 'rust-lang/rust.vim'

" FFI
Plug 'shime/vim-livedown'

" Initialize plugin system
call plug#end()

" Automatically install bundles on first run
if !isdirectory(expand("~/.vim/plugged/ctrlp.vim"))
	execute 'silent PlugInstall'
	execute 'silent q'
endif

syntax on
filetype plugin indent on       " Sets indent mode based on filetype
syntax enable
set background=dark
colorscheme base16-tomorrow     " Default color scheme
highlight LineNr   ctermfg=darkgrey ctermbg=black
highlight Pmenu    ctermfg=lightgrey ctermbg=black guifg=lightgrey guibg=black

set clipboard=unnamed           " Share OS clipboard
set encoding=utf-8              " default character encoding
set hidden                      " do not unload buffers that get hidden

set wrap                        " Wrap lines visually
set linebreak                   " Only wrap at linebreaks
set number                      " Show line numbers
set scrolloff=3                 " keep minimal number of lines above/below cursor
set splitright                  " open vertical split right of current window
set sidescroll=3                " scroll sideways 3 characters at a time
set textwidth=0                 " Maximum line text width
set colorcolumn=80              " show max line-width
set cmdheight=2                 " better display for messages

set foldmethod=indent           " Fold based on indent
set foldnestmax=3               " Deepest fold is 3 levels
set nofoldenable                " Dont fold by default

set shortmess+=c                " don't give ins-completion-menu messages
set showcmd                     " Show command line at bottom of screen
set laststatus=2                " Show last status
set visualbell                  " use visual bell instead of beeping
set signcolumn=yes              " always show sign column

set autoindent                  " Indent automatically
set backspace=indent,eol,start  " Set backspace to work for all characters

set noexpandtab                 " Use tabs for tabs
set smarttab                    " <BS> deletes a shiftwidth worth of space
set tabstop=2                   " 2 spaces for each tab in file
set softtabstop=2               " 2 spaces for pressing tab key
set shiftwidth=2                " 2 spaces for indentation
set nojoinspaces                " Do not insert two spaces after a '.'

set updatetime=2000              " diagnostic message update time

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
let g:ctrlp_user_command = [
    \ '.git', 'cd %s && git ls-files . -co --exclude-standard',
    \ 'find %s -type f'
    \ ]
nmap <Leader>p :CtrlP<CR>

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
nnoremap <Leader>gc :Gcommit -a<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gf <C-W>h<C-W>czR
nnoremap <Leader>gp :Git push<CR>

" Hindent
let g:hindent_on_save = 0

" Mappings for CoC

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <leader>d <Plug>(coc-definition)
nmap <leader>t <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
let g:airline_skip_empty_sections = 1

" function to toggle loc list with a single key
let g:localopen = 0
function ToggleLocListLocal()
	if g:localopen
		let g:localopen = 0
		lclose
	else
		let g:localopen = 1
		lopen
	endif
endfunction

nnoremap <Leader>e :call ToggleLocListLocal()<CR>

" Python
let python_highlight_all=1

" Markdown
nmap <LEADER>m :LivedownToggle<CR>
let g:livedown_browser = "safari"
