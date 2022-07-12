call plug#begin()

" Theme
" Plug 'projekt0n/github-nvim-theme'
" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'navarasu/onedark.nvim'

" Fuzzy search finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim' " To set telescope as native select UI

" File explorer
Plug 'kyazdani42/nvim-tree.lua'
"Plug 'preservim/nerdtree'

" LSP
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'kosayoda/nvim-lightbulb' " Show code action lightbulb icon

" Diagnostics
Plug 'folke/lsp-colors.nvim'
Plug 'folke/trouble.nvim'

" Autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
Plug 'windwp/nvim-autopairs'
" Completion sources
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'onsails/lspkind.nvim'

" Git
Plug 'lewis6991/gitsigns.nvim' " Editor side git status color
Plug 'sindrets/diffview.nvim' " Git diffview

" Code formatter
"Plug 'mhartington/formatter.nvim'

" Others
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' } " Syntax highlighting
Plug 'lukas-reineke/indent-blankline.nvim' " Indentation guidelines
Plug 'ellisonleao/glow.nvim', { 'branch': 'main' } " CLI Markdown renderer
Plug 'RRethy/vim-illuminate' " Highlight same word occurences
Plug 'nvim-lualine/lualine.nvim' " Bottom status line
Plug 'kyazdani42/nvim-web-devicons'
Plug 'SmiteshP/nvim-navic' " Shows code context
Plug 'akinsho/toggleterm.nvim', { 'tag' : 'v2.*' } " Terminal
Plug 'mg979/vim-visual-multi', { 'branch': 'master' } " Multiple cursors
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' } " Tabs
Plug 'karb94/neoscroll.nvim' " Smooth scroll animation
Plug 'numToStr/Comment.nvim' " Commenter
Plug 'nacro90/numb.nvim' " goto line

" Temporary fixes
Plug 'antoinemadec/FixCursorHold.nvim'

call plug#end()

" Plugin conguration
source ~/.config/nvim/plugins/nvim-tree.vim
source ~/.config/nvim/plugins/treesitter.vim
source ~/.config/nvim/plugins/indentation.vim
source ~/.config/nvim/plugins/navic.vim
source ~/.config/nvim/plugins/lualine.vim
source ~/.config/nvim/plugins/nvim-lsp-installer.vim
source ~/.config/nvim/plugins/lsp-config.vim
source ~/.config/nvim/plugins/lsp-colors.vim
source ~/.config/nvim/plugins/trouble.vim
source ~/.config/nvim/plugins/nvim-cmp.vim
source ~/.config/nvim/plugins/bufferline.vim
source ~/.config/nvim/plugins/toggleterm.vim
source ~/.config/nvim/plugins/git.vim
source ~/.config/nvim/plugins/icons.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/scroll.vim
source ~/.config/nvim/plugins/goto.vim
source ~/.config/nvim/plugins/commenter.vim
