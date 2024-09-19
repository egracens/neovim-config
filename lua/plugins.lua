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
  use 'rebelot/kanagawa.nvim'

  -- Lazygit integration
  use 'kdheepak/lazygit.nvim'

  -- Highlight indentation level
  use 'lukas-reineke/indent-blankline.nvim'

  -- Telescope for searching
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Tabs at top of the screen
  use {
    'akinsho/bufferline.nvim',
    tag = '4.5.2',
    requires = 'nvim-tree/nvim-web-devicons'
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

  -- Yaml support
  use 'Einenlum/yaml-revealer'

  -- LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use {
    'j-hui/fidget.nvim',
    tag = 'legacy'
  }

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

  use {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup{
        theme = 'hyper',
        config = {
          week_header = {
           enable = true,
          },
        },
      }
    end,
    requires = {'nvim-tree/nvim-web-devicons'}
  }

  -- Multicursor
  use 'mg979/vim-visual-multi'

  -- Search and replace
  use {
    'windwp/nvim-spectre',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Vertical Scrollbar
  use('petertriho/nvim-scrollbar')

  -- Search Highlighting
  use('kevinhwang91/nvim-hlslens')

  use('mhartington/formatter.nvim')

  -- Copilot
  use('github/copilot.vim')

  use {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    requires = {
      'zbirenbaum/copilot.lua',  -- or 'github/copilot.vim'
      'nvim-lua/plenary.nvim'    -- for curl, log wrapper
    },
    run = 'make tiktoken',       -- Only on MacOS or Linux
    config = function()
      require('CopilotChat').setup{
        debug = true,            -- Enable debugging
        -- Add any additional configuration here
      }
    end
  }

  use {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'LspAttach',
    config = function()
      require('tiny-inline-diagnostic').setup()
    end
  }

  -- Tmux integration
  use({
      "aserowy/tmux.nvim",
      config = function() return require("tmux").setup() end
  })
end)

-- the first run will install packer and our plugins
if packer_bootstrap then
  require("packer").sync()
  return
end
