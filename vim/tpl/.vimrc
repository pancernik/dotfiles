set nocompatible

" disable filetype plugins
filetype off


""" Plugins

" Directory for plugins
call plug#begin('${WORKDIR_PATH}/plugged')

Plug 'chriskempson/base16-vim'
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'chaoren/vim-wordmotion'

" languages
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Typescript
Plug 'leafgarland/typescript-vim'

" Go
Plug 'fatih/vim-go'

" Init plugins
call plug#end()

""" Generic
" Filetype plugins
filetype plugin indent on

" Easy leader
let mapleader = ","

" Fast save
map <leader>w :w!<cr>
" Fast quit
map <leader>q :q<cr>
" Fast nohlsearch
map <leader>nh :nohlsearch<cr>

" Re-read when change outside
set autoread

" Backspace through everything
set backspace=indent,eol,start
" Don't stop at first/last character in line. <> are cursor keys in normal and visual mode. [] in insert mode.
set whichwrap+=<,>,h,l,[,]

" Disable arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

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

" Faster scroll
" set ttyfast
" set lazyredraw

" System clipboard
noremap <leader>y "*y
noremap <leader>p "*p
noremap <leader>Y "+y
noremap <leader>P "+p

""" Look & feel

" Terminal supports 256 colours
set t_Co=256

" Syntax highlighting
syntax on

" Integrate with base16 shell colours
let base16colorspace=256
if filereadable(expand("~/.vimrc_background"))
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
set tw=120

" show column
set colorcolumn=120

" Auto- and smartindent
set ai
set si

" Remove whitespace on save
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

""" Plugins config

" Ack.vim
nmap <leader>ag :!<Space>
" Use silver searcher.
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" fzf (needs to be installed)
set rtp+=/usr/local/opt/fzf
nmap <leader>fz :Files<cr>

" ripgrep (needs to be installed)
nmap <leader>rg :Rg<space>

" ligthline.vim
" lightline contains it already
set noshowmode
" Always display status
set laststatus=1

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [
      \             ['mode', 'paste'],
      \             ['cocstatus', 'fugitive', 'readonly', 'filename', 'modified'],
      \           ],
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
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ }
      \ }

" NERDTree
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeShowHidden=1

let g:NERDTreeWinSize=35
let g:NERDTreeWinPos="left"

nmap <leader>nn :NERDTreeToggle<cr>
nmap <leader>nf :NERDTreeFind<cr>

"git / fugitive
nmap <leader>gs :G<cr>
nmap <leader>gd :Gdiffsplit<cr>
nmap <leader>gb :Gblame<cr>

" MRU
nmap <leader>mr :MRU<cr>

" vim-signify
let g:signify_realtime = 1

" languages config

" jsoc comments highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

" coc
if filereadable(expand("~/.vim/coc-settings.json"))
  " Gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gt <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Rename current word
  nmap <leader>rn <Plug>(coc-rename)

  " Docs
  nmap <silent> gh :call CocAction('doHover')<CR>
  nmap <silent> go :CocList outline<CR>
  nmap <silent> gs :CocList -I symbols<CR>
endif

" go-vim
let g:go_autodetect_gopath = 1
let g:go_jump_to_error = 0

let g:go_def_mapping_enabled = 0
let g:go_info_mode = 'gopls'

let g:go_fmt_command = 'goimports'
let g:go_fmt_autosave = 1

let g:go_metalinter_autosave = 1
let g:go_metalinter_command = 'golangci-lint run'

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

autocmd FileType go nmap <leader>a  <Plug>(go-alternate)

" python
