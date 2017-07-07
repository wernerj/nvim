set nocompatible
filetype off

"set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" tpope is god
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/rbenv-ctags'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-liquid'
" themes
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" file navigation
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
" code structure
Plugin 'mattn/emmet-vim'
" Plugin 'ervandew/supertab'
Plugin 'kana/vim-textobj-user'
" ruby specific
Plugin 'vim-ruby/vim-ruby'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'ecomba/vim-ruby-refactoring'
" misc
Plugin 'loremipsum'
Plugin 'othree/eregex.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'roman/golden-ratio'
" snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'"
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'elmcast/elm-vim'
" css
" Plugin 'skammer/vim-css-color'
"
" Plugin 'camthompson/vim-ember'
Plugin 'AndrewRadev/ember_tools.vim'
Plugin 'mustache/vim-mustache-handlebars'
" Typescript
Plugin 'leafgarland/typescript-vim'
Plugin 'HerringtonDarkholme/yats.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"
" Put your non-Plugin stuff after this line

let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
runtime macros/matchit.vim
let mapleader = ","
noremap , <Nop>
let NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:airline_powerline_fonts = 1

colorscheme solarized
set background=dark
" set background=light

" let g:solarized_termcolors=256
" set highlight-ctermbg=none

" Basic settings
syntax on
set backspace=2
set is
set ignorecase
set smartcase 
set number
set relativenumber
set numberwidth=5
set colorcolumn=140
set splitbelow
set splitright


nmap <leader>ct :!ctags -R .<CR>
nmap <leader>pl :PluginInstall<CR>

" Copy and paste
set clipboard=unnamedplus
nmap <leader>y "+y
nmap <leader>p "+p
nmap <leader>co ggVG"+y
nmap <leader>= magg=G'a

" Typos correction
command! W w
command! Q q
command! B b
cnorea   X x

" Always display filename
set modeline
set ls=2

" And no wrapping by default, I'm a programmer
set nowrap                                    

" Autocompletion is golden
set wildmenu

" Edit everywhere
set virtualedit=all
set directory=.,$TEMP

" Remap window jumping
nmap <leader>l <C-W>l
nmap <leader>h <C-W>h
nmap <leader>k <C-W>k
nmap <leader>j <C-W>j

nmap <leader>w :bd<CR>
nmap <leader>s :w<CR>
nmap <leader>q :q<CR>

" Set filetype stuff to on
filetype on
" filetype indent on
" filetype plugin on

" Tabstops
set softtabstop=2
set autoindent
set shiftwidth=2
set expandtab

" Indent/unindent line in vmode
vnoremap <TAB> ><cr>gv
vnoremap <S-TAB> <<cr>gv
nmap <TAB> >>
nmap <S-TAB> <<

" Scroll current line to the first quarter of the screen
nmap <space> zz20<C-E>

map <PageUp> <C-b>
map <PageDown> <C-f>
map <F3> :set hls!<CR>
map <F4> :b#<CR>
map <F5> :bp<CR>
map <F6> :bn<CR>

" Edit conf
nmap <leader>ev :tabe ~/.config/nvim/init.vim<CR>
nmap <leader>, :w<CR>:source ~/.config/nvim/init.vim<CR>
nmap <leader>eal :e ~/etc/dotfiles/bash/aliases<CR>
nmap <leader>ee  :e!<CR>
nmap <leader>o :e <C-R>=expand("%:p:h") . '/'<CR>

" Transparent background
" hi normal ctermbg=none
"
" Escape insert mode
imap jk <esc>
imap kj <esc>

autocmd Filetype help nmap <buffer> q :bd<CR>
autocmd Filetype help nmap <buffer> o <C-w>o
autocmd Filetype help nmap <buffer> d <C-d>
autocmd Filetype help nmap <buffer> u <C-u>

autocmd BufWritePre *.elm ElmFormat

inoremap {<CR> {<CR>}<esc>ko

" ctrlp-py
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" if executable('ag')
"   " Make CtrlP use ag for listing the files. Way faster and no useless files.
"   " let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
"   let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'
"   let g:ctrlp_use_caching = 0
let g:ackprg = 'ag --vimgrep'
" endif

if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
   " Use ripgrep over grep
   set grepprg=rg\ --nogroup\ --nocolor

   " Use ripgrep in CtrlP for listing files
   let g:ctrlp_user_command = 'rg --files  %s'

   " Ripgrep is fast enough that CtrlP doesn't need to cache
   let g:ctrlp_use_caching = 0
endif

nnoremap \ :Ack<space>
      
" maps to option-o, enter a line above the current line
imap ø <ESC>^O

" intro to vimscript
nmap <leader>x :exec getline('.')<CR>


" ignore site directory in ctrlp
" let g:ctrlp_custom_ignore = 'node_modules'

let g:ctrlp_custom_ignore = { 'dir':  '\v[\/]\.(_site|node_modules).*$' }

" identifiers include dashes
set iskeyword+=\-

" Mustache/Handlebars abbreviations
let g:mustache_abbreviations = 1

" Typescript errors
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow


" Rails leader commands
nmap <leader>sc :e db/schema.rb<CR>
nmap <leader>bo :Bopen<CR>

" Disable arrow keys
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

" Vim. Live it
inoremap <Up> <NOP>
vnoremap <Up> <NOP>
inoremap <Down> <NOP>
vnoremap <Down> <NOP>
inoremap <Left> <NOP>
vnoremap <Right> <NOP>
vnoremap <Left> <NOP>
inoremap <Right> <NOP>
" B-A-<start>


" Fugitive shortcuts
nmap <leader>gs :Gstatus<CR>

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set ruler

" Always split vertically
set splitright
set diffopt+=vertical
" set splitvertical
