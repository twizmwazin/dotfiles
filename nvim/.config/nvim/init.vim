call plug#begin()

" Gruvbox, a retro color scheme
Plug 'morhetz/gruvbox'

" Vim Airline, statusline
Plug 'vim-airline/vim-airline'

" Fugitive, a git plugin, probably illegal
Plug 'tpope/vim-fugitive'

" Gitgutter, show git diff
Plug 'airblade/vim-gitgutter'

" NERD Tree, file tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" NERD Commenter, easy line commenting
Plug 'scrooloose/nerdcommenter'

"Symtastic, syntax checking for many languages
Plug 'scrooloose/syntastic'

" Auto Pairs, automatic closing of braces
Plug 'jiangmiao/auto-pairs'

" A, easy switching between header files
Plug 'vim-scripts/a.vim'

" Better Whitespace, highlighting of trailing whitespace
Plug 'ntpeters/vim-better-whitespace'

" CtrlP, fuzzy path finder
Plug 'ctrlpvim/ctrlp.vim'

" Tagbar, source structure overview
Plug 'majutsushi/tagbar'

" Autoformat, clean up my messy code
Plug 'Chiel92/vim-autoformat'

" Startify, admittedly bloat but whatever
Plug 'mhinz/vim-startify'

"""
" File types
"""
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'hdima/python-syntax'
Plug 'pangloss/vim-javascript'

"""
" File completions
"""
" YouCompleteMe, a plugin for auto completion
Plug 'Valloric/YouCompleteMe'
Plug 'ternjs/tern_for_vim' " Javascript


call plug#end()

" Visual settings
set background=dark
set number
set cursorline
set colorcolumn=80
set nowrap
colorscheme gruvbox

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Fix tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Airline settings
set noshowmode
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1

" YCM Settings;
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist=['~/']
let g:ycm_autoclose_preview_window_after_insertion=1

let g:ycm_show_diagnostics_ui = 0

" NERDTree settings
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Syntastic settings
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

let g:syntastic_javascript_checkers=['eslint']

" Key bindings
let mapleader=" "
set timeoutlen=100

" Show file tree
nmap <leader>n :NERDTreeToggle<CR>

" Alternate header files
nmap <leader>a :A<CR>
nmap <leader>s :AS<CR>

" Open files
nmap <leader>o :CtrlP<CR>

" Format code
nmap <leader>f :Autoformat<CR>

" Show code tags
nmap <leader>t :TagbarToggle<CR>

" Toggle color highlighting
nmap <leader>c :ColorToggle<CR>
