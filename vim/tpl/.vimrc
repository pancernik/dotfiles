" disable vi comaptibility mode 
set nocompatible

" disable filetype plugins
filetype off


""" Plugins

" set the runtime path to include Vundle and initialize
set rtp+=${VUNDLE_PATH}/Vundle.vim
call vundle#begin('${VUNDLE_PATH}')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'mileszs/ack.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify' 
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'yegappan/mru'

" languages
Plugin 'fatih/vim-go'
Plugin 'vim-scripts/indentpython.vim'

" All of your Plugins must be added before the following line
call vundle#end()

""" Generic
" Filetype plugins
filetype plugin indent on

" Easy leader 
let mapleader = ","

" Fast save
map <leader>w :w!<cr>
" Fast quit
map <leader>q :q<cr>

" Re-read when change outside
set autoread

"

" Backspace through everything
set backspace=indent,eol,start
" Don't stop at first/last character in line. <> are cursor keys in normal and visual mode. [] in insert mode.
set whichwrap+=<,>,h,l,[,]


" Keep 100 lines of cmd history
set history=100
" Display incomplete commands
set showcmd
" Autocomplete commands
set wildmenu

" Do incremental searching when it's possible
set incsearch
" Ignore case when searching
set ignorecase
" Be smart about case
set smartcase
" Highlight search
set hlsearch

" No backups
set nobackup
set nowb
set noswapfile

 

""" Look & feel

" Syntax highlighting in GUI or term with colours
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" Integrate with base16 shell colours
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Show matching brackets
set showmatch

" Add extra space
set foldcolumn=1

" Show cursor position at all times
set ruler

" Show line numbers
set nu
" Relative line numbers
set relativenumber

" Spaces over tabs
set expandtab
" 1 tab = 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak & wrapping
set wrap
set lbr
set tw=180

" Auto- and smartindent
set ai
set si


""" Plugins config

" Ack.vim
nmap <leader>Ack :!<Space>
" Use silver searcher.
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" fzf
" Installed by homebrew
set rtp+=/usr/local/opt/fzf
nmap <leader>fz :Files<cr>

" ligthline.vim
" lightline contains it already
set noshowmode
" Always display status 
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

" NERDTree
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeShowHidden=1

let g:NERDTreeWinSize=45
let g:NERDTreeWinPos = "right"

nmap <leader>nn :NERDTreeToggle<cr>
nmap <leader>nf :NERDTreeFind<cr>

" MRU
nmap <leader>mr :MRU<cr>

" vim-signify
let g:signify_realtime = 1

" languages config

" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1


