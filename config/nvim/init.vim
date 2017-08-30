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
Plug 'zchee/deoplete-clang', { 'for': 'cpp' }
Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make'}
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }

Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

Plug 'w0rp/ale'
Plug 'sbdchd/neoformat'

Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries'}

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
set hidden

autocmd FileType vim setlocal foldmethod=marker

set tabstop=4
set softtabstop=4
set shiftwidth=4

set expandtab
autocmd FileType go set noexpandtab

set termguicolors
colorscheme base16-tomorrow-night
" }}}

" Plugin settings {{{
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_refresh_delay = 0
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['around', 'buffer']
let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib64/clang'
let g:deoplete#sources#go#gocode_binary = 'gocode'

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:ale_linters = {
      \   'go': ['go build'],
      \   'java': ['javac'],
      \   'rust': ['rls'],
      \ }

let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_enabled_go = ['gofmt']


let $RUST_SRC_PATH = glob("$HOME/.rustup/toolchains/nightly*/lib/rustlib/src/rust/src")
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
      \ 'c': ['clangd'],
      \ 'cpp': ['clangd'],
      \ 'python': ['pyls'],
      \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
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

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
"}}}
