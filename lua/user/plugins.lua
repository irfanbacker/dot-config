-- Automatic packer.nvim installation (if not installed)
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
  vim.api.nvim_command('packadd packer.nvim')
end

-- Protected call for packer(To avoid displaying errors)
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return error('Packer: Not callable')
end

-- Open packer in a floating window
packer.init({
  max_jobs = 10,
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end
  }
})

return packer.startup(function(use)
  -- Global plugins
  use 'wbthomason/packer.nvim' -- Manage itself
  use 'nvim-lua/plenary.nvim' -- Useful functions for other packages
  use { 'kyazdani42/nvim-web-devicons', config = function() require('user.config.web-devicons') end } -- Generic icons for some packages

  -- Themes
  use { 'navarasu/onedark.nvim', config = function()
    vim.cmd(':colorscheme onedark')
  end }

  -- Fuzzy search finder
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('user.config.telescope') end
  }
  use { 'nvim-telescope/telescope-ui-select.nvim', requires = { 'nvim-telescope/telescope.nvim' } } -- To set telescope as native select UI

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    tag = 'nightly',
    config = function() require('user.config.nvim-tree') end,
  }

  -- Treesitter config
  use { 'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = function() require('user.config.treesitter') end,
  }

  -- LSP
  use { 'neovim/nvim-lspconfig', config = function() require('user.config.lsp-config') end } -- Native LSP
  use 'williamboman/nvim-lsp-installer' -- Language server installer for native LSP
  use {
    'kosayoda/nvim-lightbulb', -- Show code action lightbulb icon
    requires = 'antoinemadec/FixCursorHold.nvim',
  }

  -- Diagnostics
  use { 'folke/lsp-colors.nvim', config = function() require('user.config.lsp-colors') end } -- Automatically create missing LSP diagnostics highlight groups
  use {
    'folke/trouble.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', 'folke/lsp-colors.nvim' },
    config = function() require('user.config.trouble') end,
  }

  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'neovim/nvim-lspconfig',
      'onsails/lspkind.nvim',
      {
        'hrsh7th/cmp-nvim-lsp',
        requires = { 'hrsh7th/cmp-nvim-lsp-document-symbol', 'hrsh7th/cmp-nvim-lsp-signature-help' },
      },
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      { 'saadparwaiz1/cmp_luasnip', requires = 'L3MON4D3/LuaSnip' },
    },
    config = function() require('user.config.nvim-cmp') end
  }
  use {'windwp/nvim-autopairs', config = function() require('user.config.autopairs') end}

  -- Git
  use { 'lewis6991/gitsigns.nvim', tag = 'release', config = function() require('user.config.gitsigns') end } -- Editor side git status color
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim',
    config = function() require('user.config.diffview') end } -- Git diffview

  -- Tabs
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('user.config.bufferline') end,
  }

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('user.config.lualine') end,
  }

  -- Terminal
  use { "akinsho/toggleterm.nvim", tag = 'v2.*', config = function() require('user.config.toggleterm') end }

  -- Others
  use { 'lukas-reineke/indent-blankline.nvim', config = function() require('user.config.indentation') end } -- Indentation guidelines
  use { 'ellisonleao/glow.nvim', branch = 'main' } -- CLI markdown renderer
  use 'RRethy/vim-illuminate' -- Shows code context
  use { 'SmiteshP/nvim-navic', requires = 'neovim/nvim-lspconfig', config = function() require('user.config.navic') end } -- Display code context
  use { 'mg979/vim-visual-multi', branch = 'master' } -- Multiple cursor actions
  use { 'karb94/neoscroll.nvim', config = function() require('user.config.scroll') end } -- Smooth scrolling
  use { 'numToStr/Comment.nvim', config = function() require('user.config.commenter') end, } -- Commenter
  use { 'nacro90/numb.nvim', config = function() require('user.config.goto') end } -- Goto line

  -- Install all packages if packer.nvim is just installed
  if packer_bootstrap then
    require('packer').sync()
  end
end)
