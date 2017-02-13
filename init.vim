set nocompatible
filetype off

let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

"set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-commentary'
Plugin 'morhetz/gruvbox'
Plugin 'herrbischoff/cobalt2.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'tComment'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
" Plugin 'FelikZ/ctrlp-py-matcher'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
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

let mapleader = ","
noremap , <Nop>
let NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:airline_powerline_fonts = 1

colorscheme gruvbox
set background=dark
"set highlight-ctermbg=none

" Basic mappings
set backspace=2
syntax on
set number
set numberwidth=5
set colorcolumn=140
nmap <leader>bd :bd<CR>

" Copy and paste
set clipboard=unnamedplus
nmap <leader>y "+y
nmap <leader>p "+p
nmap <leader>co ggVG"+y

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
set nowrapscan

" Autocompletion is golden
set wildmenu

" Edit everywhere
set virtualedit=all
set directory=.,$TEMP

" Remap window jumping
nmap ,l <C-W>l
nmap ,h <C-W>h
nmap ,k <C-W>k
nmap ,j <C-W>j

" Set filetype stuff to on
filetype on
filetype indent on
filetype plugin on

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

" Edit conf
nmap <leader>ev :tabe ~/.config/nvim/init.vim<CR>
nmap <leader>, :source ~/.config/nvim/init.vim<CR>
nmap <leader>eaw :e ~/.config/awesome/rc.lua<CR>
nmap <leader>eal :e ~/etc/dotfiles/bash/aliases<CR>
nmap <leader>ee  :e!<CR>


" Transparent background
" hi normal ctermbg=none
"
" Escape insert mode
imap jk <esc>
imap kj <esc>

autocmd Filetype help nmap <buffer> q :bd<CR>
autocmd Filetype help nmap <buffer> o <C-w>o

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
