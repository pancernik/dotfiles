set nocompatible

" disable filetype plugins
filetype off


""" Plugins

" Directory for plugins
call plug#begin('${WORKDIR_PATH}/plugged')

Plug 'tinted-theming/base16-vim'
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'xuyuanp/nerdtree-git-plugin'
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
Plug 'hashivim/vim-terraform'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'dcampos/nvim-snippy'
Plug 'honza/vim-snippets'
Plug 'dcampos/cmp-snippy'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/eslint.nvim'

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
set ttyfast
set lazyredraw

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
if exists('\$BASE16_THEME')
  echo $BASE16_THEME
  colorscheme base16-\$BASE16_THEME
endif

" Show matching brackets
set showmatch

" Add extra space
set foldcolumn=1

" Show cursor position at all times
set ruler
" Horitzontal line
set cursorline
" Vertical line
set cursorcolumn

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
set tw=160

" show column
set colorcolumn=160

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
      \             ['fugitive', 'readonly', 'absolutepath', 'modified'],
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
      \ }
      \ }

" NERDTree
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeShowHidden=1

let g:NERDTreeWinSize=60
let g:NERDTreeWinPos="left"
let g:NERDTreeMinimalUI = 1

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

" json comments highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

" go-vim
let g:go_autodetect_gopath = 1

" disable features provided by LSP
let g:go_jump_to_error = 0
let g:go_def_mapping_enabled = 0
let g:go_gopls_enabled = 0
" let g:go_fmt_autosave = 0
" let g:go_imports_autosave = 0

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

autocmd FileType go nmap <leader>a  <Plug>(go-alternate)

autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics{focusable=false}

" nvim-lspconfig

lua << EOF

local lspconfig = require 'lspconfig'

local setup_key_bindings = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)

  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
end


local cmp = require 'cmp'

cmp.setup {
  snippet = {
    expand = function(args)
      require('snippy').expand_snippet(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'snippy' },
  }, {
    { name = 'buffer' },
  })
}

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Go
lspconfig.gopls.setup {
  on_attach = setup_key_bindings,
  capabilities = capabilities,
  settings = {
    gopls = {
      ["local"] = "github.com/ksoc-private,github.com/pancernik",
      analyses = {
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
}

-- Ruby
lspconfig.solargraph.setup {
  on_attach = setup_key_bindings,
  capabilities = capabilities,
}

-- Typescript
lspconfig.tsserver.setup {
  on_attach = setup_key_bindings,
  capabilities = capabilities,
}

-- Eslint
lspconfig.eslint.setup {
  on_attach = setup_key_bindings,
  capabilities = capabilities,
  bin = 'eslint',
  code_actions = {
    enable = true,
    apply_on_save = {
      enable = true,
      types = { "directive", "problem", "suggestion", "layout" },
    },
    disable_rule_comment = {
      enable = true,
      location = "separate_line", -- or `same_line`
    },
  },
  diagnostics = {
    enable = true,
    report_unused_disable_directives = false,
    run_on = "type", -- or `save`
  },
}
EOF

" diagnostics

lua << EOF
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

nnoremap <leader>tr <cmd>TroubleToggle<cr>

" terraform
let g:terraform_fmt_on_save = 1
