" First SETTING the sets
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=yes

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to a poor user
" experience
set updatetime=50

" <---------- VIM PLUG CONFIGURATION ---------->
call plug#begin('~/.vim/plugged')

" Telescope plugin and requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Coc Plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Neovim Treesitter 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Colorscheme (The only colorscheme allowed here is GRUVBOX)
Plug 'gruvbox-community/gruvbox'

" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Prettier
Plug 'sbdchd/neoformat'

call plug#end()

" Setting the colorscheme and background configuration
colorscheme gruvbox
highligh Normal guibg=none


" <---------- KEY REMAPS ---------->

