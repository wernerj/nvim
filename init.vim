set nocompatible
filetype off

" To install minpac:
" mkdir -p ~/.config/nvim/pack/minpac/opt
" cd ~/.config/nvim/pack/minpac/opt
" git clone https://github.com/k-takata/minpac.git

packadd minpac
call minpac#init()

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
" register minpac so it can be updated
call minpac#add('k-takata/minpac')

" tpope is god
call minpac#add('tpope/vim-fugitive')
call minpac#add('tommcdo/vim-fubitive')
call minpac#add('tpope/vim-rhubarb')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-rails')
call minpac#add('tpope/vim-vinegar')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-bundler')
call minpac#add('tpope/vim-rake')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/rbenv-ctags')
call minpac#add('tpope/vim-haml')
call minpac#add('tpope/vim-liquid')

" themes
" call minpac#add('morhetz/gruvbox', {'type': 'opt'})
call minpac#add('altercation/vim-colors-solarized', {'type': 'opt'})
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
" call minpac#add('blueyed/vim-diminactive')
" file navigation
" call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('mileszs/ack.vim')
" code structure
" call minpac#add('mattn/emmet-vim')
" Plugin 'ervandew/supertab'
call minpac#add('kana/vim-textobj-user')
call minpac#add('kana/vim-textobj-entire')
" ruby specific
call minpac#add('vim-ruby/vim-ruby')
call minpac#add('nelstrom/vim-textobj-rubyblock')
call minpac#add('ecomba/vim-ruby-refactoring')
" misc
call minpac#add('othree/eregex.vim')
" call minpac#add('pangloss/vim-javascript')
call minpac#add('roman/golden-ratio')
call minpac#add('machakann/vim-highlightedyank')
" snippets
" call minpac#add('MarcWeber/vim-addon-mw-utils')
" call minpac#add('tomtom/tlib_vim')
" call minpac#add('garbas/vim-snipmate')
" call minpac#add('honza/vim-snippets')
call minpac#add('FelikZ/ctrlp-py-matcher')
" call minpac#add('elmcast/elm-vim')
" css
" call minpac#add('skammer/vim-css-color', {'type': 'opt'})
call minpac#add('mustache/vim-mustache-handlebars', {'type': 'opt'})
call minpac#add('kassio/neoterm')
call minpac#add('janko-m/vim-test')
"  Crystal
call minpac#add('rhysd/vim-crystal')
" Golang
call minpac#add('fatih/vim-go')
call minpac#add('aserebryakov/vim-todo-lists')
let g:VimTodoListsMoveItems = 0

filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" " filetype plugin on
" "
" Put your non-Plugin stuff after this line

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
runtime macros/matchit.vim
let mapleader = ","
noremap , <Nop>
let NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:airline_powerline_fonts = 1

colorscheme solarized
set background=dark
" Transparent background
" hi normal ctermbg=none

" Basic settings
syntax on
set backspace=2
set is
set ignorecase
set smartcase 
set number
set relativenumber
set numberwidth=5
set colorcolumn=120
set splitbelow
set splitright


" nmap <leader>ct :!ctags -R .<CR>
nmap <leader>ct :Ctags<CR>
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
nmap g<space> zt3k3j
" nmap g<space> zz10<C-E>

map <PageUp> <C-b>
map <PageDown> <C-f>
map <F3> :set hls!<CR>
map <F4> :b#<cr>

" Edit conf
nmap <leader>ev :tabe ~/.config/nvim/init.vim<CR>
nmap <leader>, :w<CR>:source ~/.config/nvim/init.vim<CR>
nmap <leader>eal :e ~/etc/dotfiles/bash/aliases<CR>
nmap <leader>ee  :e!<CR>
nmap <leader>o :e <C-R>=expand("%:p:h") . '/'<CR>

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
inoremap (<CR> (<CR>)<esc>ko

" ctrlp-py
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" if executable('ag')
"   " Make CtrlP use ag for listing the files. Way faster and no useless files.
"   " let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
"   let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'
"   let g:ctrlp_use_caching = 0
let g:ackprg = 'ag --vimgrep'
" endif
let g:ctrlp_max_files=0

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
let g:ctrlp_custom_ignore = 'node_modules\|_site'
" let g:ctrlp_custom_ignore = { 'dir':  '\v[\/]\.(_site\|node_modules).*$' }

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
" Highlight pattern replace
set inccommand=split
"
" Highlight yank
let g:highlightedyank_highlight_duration = 400

" Escape terminal mode
if has('nvim')
  tnoremap <expr> <A-r> '<C-\><C-n>"'.nr2char(getchar()).'pi'
  tnoremap <Esc> <C-\><C-n>
  tnoremap <A-[> <C-\><C-n>
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-l> <C-\><C-n><C-w>l
  tnoremap <A-h> <C-\><C-n><C-w>h
  nnoremap <A-h> <C-w>h
  nnoremap <A-l> <C-w>l
  nnoremap <A-k> <C-w>k
  nnoremap <A-j> <C-w>j
  nnoremap <A-t> :split <bar> terminal<CR>

  command! RailsConsole T rails console
  command! RailsMigrate T rails db:migrate
  nnoremap <leader>tn :TestNearest<cr>
  nnoremap <leader>tl :TestLast<cr>
  nnoremap <leader>tf :TestFile<cr>

  nnoremap <leader>gp :T gp<cr><C-w>ji

endif

" switch between open buffers
nnoremap gb :ls<cr>:b<space>

" Visual @ - https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Emmet jsx
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

nnoremap n nzz " show the next result at the center of the screen
nnoremap N Nzz " show the next result at the center of the screen

" My help
nnoremap <leader>mh :h myhelp<cr>
nnoremap <leader>eh :e ~/.config/nvim/pack/minpac/start/myhelp/doc/myhelp.txt<cr>

" Enter binding.pry
nnoremap <leader>bp Obinding.pry<esc>

" Format Json
com! FormatJSON %!python -c "import json, sys, collections; print json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), indent=4)"

" JazzEdge
nnoremap ,/ 0/540pnnbbbbbbbbyi"op:s/\\//g<cr>y$
nnoremap ,\ 0/360pnnnnbbbbbbbbyi"op:s/\\//g<cr>y$
nmap <leader>d :%d<cr>
nnoremap ,p op
nmap <leader>to :sp ~/cmg.todo.md<cr>
nmap <leader>ta :vsp ~/cmg.archived.todo.md<cr>
