set nocompatible
filetype off

"set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'morhetz/gruvbox'

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

let NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:gruvbox_bold=1
let g:gruvbox_italic=1

colorscheme gruvbox
set background=dark
syntax on
set number
set numberwidth=5
set clipboard+=unnamedplus


" Basic mappings
nmap ,ev :e ~/.config/nvim/init.vim<CR>
nmap ,, :source ~/.config/nvim/init.vim<CR>
nmap ,bd :bd<CR>

" Copy and paste
nmap ,y "+y
nmap ,p "+p

" Typos correction
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev B b

set colorcolumn=140

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
