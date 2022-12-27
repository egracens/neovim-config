local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Theme
  use 'morhetz/gruvbox'

  -- Telescope for searching
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Tabs at top of the screen
  use {
    'romgrk/barbar.nvim',
    requires = { { 'nvim-tree/nvim-web-devicons' } }
  }

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- File tree with icons
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- JS indentation and highlighting
  use 'pangloss/vim-javascript'
  use 'MaxMEllon/vim-jsx-pretty'

  -- TS integration
  use 'leafgarland/typescript-vim'
  use 'peitalin/vim-jsx-typescript'

  -- Ruby on Rails integration
  use 'tpope/vim-rails'

  -- Ruby integration
  use 'vim-ruby/vim-ruby'

  -- Go integration
  use 'fatih/vim-go'

  -- Rust integration
  use 'rust-lang/rust.vim'
  use 'simrat39/rust-tools.nvim'

  -- Test helpers
  use 'vim-test/vim-test'

  -- Store session
  use 'natecraddock/sessions.nvim'

  -- Notes
  use 'vimwiki/vimwiki'
  use 'michal-h21/vim-zettel'

  -- Yaml support
  use 'Einenlum/yaml-revealer'

  -- LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'j-hui/fidget.nvim'

  -- Code suggestions dropdown
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- Snippets support
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  -- Syntax highlighting
  use 'nvim-treesitter/nvim-treesitter'
  use 'mhinz/vim-startify'

  -- Multicursor
  use 'mg979/vim-visual-multi'
end)

-- the first run will install packer and our plugins
if packer_bootstrap then
  require("packer").sync()
  return
end
