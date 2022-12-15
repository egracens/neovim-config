return require('packer').startup(function(use)
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

  -- Airline and git integration for it
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'tpope/vim-fugitive'

  -- File tree with icons
  use 'preservim/nerdtree'
  use 'ryanoasis/vim-devicons'

  -- JS indentation and highlighting
  use 'pangloss/vim-javascript'
  use 'MaxMEllon/vim-jsx-pretty'

  -- Ruby on Rails integration
  use 'tpope/vim-rails'

  -- Ruby integration
  use 'vim-ruby/vim-ruby'

  -- Go integration
  use 'fatih/vim-go'

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

  -- Code suggestions dropdown
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- Snippets support
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
end)
