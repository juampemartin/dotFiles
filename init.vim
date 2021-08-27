" External files

" First SETTING the sets
set tabstop=2 softtabstop=2
set shiftwidth=2
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

" Having longer update-time (default is 4000 ms = 4s) leads to a poor user
" experience
set updatetime=50

" Set <Leader> map
let mapleader=","

" <---------- VIM PLUG CONFIGURATION ---------->
call plug#begin('~/.vim/plugged')

" Telescope plugin and requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Coc Plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Neovim Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Colorschemes
Plug 'gruvbox-community/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'joshdick/onedark.vim'
Plug 'overcache/NeoSolarized'


" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Prettier and Discord rich presence
Plug 'sbdchd/neoformat'
Plug 'andweeb/presence.nvim'

Plug 'HerringtonDarkholme/yats.vim'
Plug 'airblade/vim-gitgutter'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'norcalli/nvim-colorizer.lua'

call plug#end()

" Treesitter Configuration

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF

" Setting the colorscheme and background configuration;

syntax on
colorscheme nvcode

" Airline theme
let g:airline_theme='ayu'

" Configure nvcode-colorschemes
let g:nvcode_termcolors=256

" Check if terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

highlight Normal guibg=none

" <---------- COC NMAPS CONFIGURATION ---------->
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" <---------- GIT GUTTER SYMBOLS ---------->
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '*'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

" <---------- COC SNIPPETS CONFIGURATION ---------->
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" <---------- TELESCOPE CONFIGURATION ---------->
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" <---------- PRETTIER CONFIGURATION ---------->
autocmd BufWritePre *.js Neoformat

