"
" Kevin Phoenix's init.vim
"

" Plugins {{{1
" vim-plug {{{2
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
" }}}2

call plug#begin()

Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'ntpeters/vim-better-whitespace'

Plug 'twizmwazin/delimitMate', { 'branch': 'fix-cr' }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neco-vim'
Plug 'zchee/deoplete-clang', { 'for': ['c', 'cpp', 'objc', 'objcpp'] }
Plug 'racer-rust/vim-racer', { 'for': ['rust'] }
Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make'}
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }

Plug 'w0rp/ale'
Plug 'sbdchd/neoformat'

Plug 'itchyny/lightline.vim'
Plug 'mike-hearn/base16-vim-lightline'

Plug 'sheerun/vim-polyglot'
Plug 'chriskempson/base16-vim'

call plug#end()
" }}}1

" Vim settings {{{
set mouse=a
set colorcolumn=81
set number
set nowrap
set nohlsearch
set scrolloff=4
set noshowmode

autocmd FileType vim setlocal foldmethod=marker

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set termguicolors
colorscheme base16-tomorrow-night
" }}}

" Plugin settings {{{
let g:delimitMate_expand_cr = 1

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_refresh_delay = 0
let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib64/clang'
let g:deoplete#sources#go#gocode_binary = 'gocode'

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:ale_linters = {
      \   'rust': ['rls'],
      \   'java': ['javac'],
      \ }

let g:lightline = {
      \ 'colorscheme': 'base16_tomorrow_night'
      \ }
" }}}

" Keybindings {{{
let mapleader =  ' '
nnoremap <leader>f :Neoformat<CR>
nnoremap <leader>s :StripWhitespace<CR>

inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
"}}}
