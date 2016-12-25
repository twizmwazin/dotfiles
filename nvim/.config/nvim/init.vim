"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Kevin Phoenix's init.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugins {{{1
" Automatically get vim-plug if it is missing {{{2
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" }}}2

" Plugin Functions {{{2

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
    UpdateRemotePlugins
  endif
endfunction

" }}}2

call plug#begin()

" Automatically set buffer options
Plug 'tpope/vim-sleuth'

" Add a few more text objects
Plug 'wellle/targets.vim'

" Easy cimmenting/uncommenting
Plug 'tpope/vim-commentary'

" Repeat custom commands
Plug 'tpope/vim-repeat'

" Easily change surrounding quotes/brackets/whatever
Plug 'tpope/vim-surround'

" Highlight trailing whitespace
Plug 'ntpeters/vim-better-whitespace'

" Auto-complete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets'
Plug 'zchee/deoplete-clang', { 'for' : ['c', 'cpp', 'objc', 'objcpp'] }
Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/context_filetype.vim'

" Automatically close tags
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-endwise'

" Linting
Plug 'w0rp/ale'

" Autoformatting
Plug 'Chiel92/vim-autoformat'

" Fuzzy-find files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Switch files quickly
Plug 'yangle/a.vim'

" Search files
Plug 'rking/ag.vim'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" File tree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Git interface
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Markdown live preview
Plug 'euclio/vim-markdown-composer', {
      \ 'do': function('BuildComposer'),
      \ 'for': 'markdown'
      \ }

" Startup screen
Plug 'mhinz/vim-startify'

" Syntax highlighting pack for many languages
Plug 'sheerun/vim-polyglot'

" Base16 theme pack
Plug 'Soares/base16.nvim'

call plug#end()
" }}}1

" Misc Settings {{{1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

set autoread
set ignorecase
set smartcase
set splitbelow
set splitright
set number
set cursorline
set nowrap
set colorcolumn=80
set foldmethod=marker
set scrolloff=4

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" }}}1

" Theme Settings {{{1

set termguicolors
set background=dark
colorscheme eighties
Base16Highlight ColorColumn bg=similar3
Base16Highlight Pmenu bg=similar2
Base16Highlight MatchParen fg=bg bg=fg

Base16Highlight ExtraWhitespace bg=dark2

" }}}1

" Plugin Settings {{{1
silent exec "!command"
set noshowmode

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_eighties'

" Deoplete settings
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#max_list = 24
let g:deoplete#max_menu_width = 64
let g:deoplete#enable_refresh_always = 1
let g:deoplete#auto_refresh_delay = 0
let g:neopairs#enable = 1

" Clang stuff
let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/include/'

" Rust stuff
let g:deoplete#sources#rust#racer_binary = '/home/kevin/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path = '/home/kevin/.local/src/rust'

" Hide completion preview when finsihed
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" This breaks my bindings currently
let g:endwise_no_mappings = 1
" }}}1

" Custom Keybindings {{{1

" Keybing Functions {{{2
function s:super_tab()
  if pumvisible()
    return "\<c-n>"
  elseif neosnippet#expandable_or_jumpable()
    return "\<Plug>(neosnippet_expand_or_jump)"
  else
    return "\<tab>"
  endif
endfunction

function s:super_enter()
  if pumvisible()
    return deoplete#close_popup()
  else
    return "\<CR>"
  endif
endfunction

" }}}2

let mapleader = " "

" Command Aliases
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>a :A<CR>
nnoremap <silent> <leader>h :nohlsearch<CR>
nnoremap <silent> <leader>f :Autoformat<CR>
nnoremap <silent> <leader>o :FZF<CR>
nnoremap <leader>g :Ag<space>

" Common typos
cnoremap W w
cnoremap Wq wq
cnoremap Q q
cnoremap Qa qa

" Tab Complete
imap <silent><expr><TAB> <SID>super_tab()
imap <silent><expr><CR> <SID>super_enter()
imap <silent><expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" }}}1
