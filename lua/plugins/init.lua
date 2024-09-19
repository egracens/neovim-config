return {
  -- Theme
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true },
  { 'rebelot/kanagawa.nvim' },

  -- Lazygit integration
  { 'kdheepak/lazygit.nvim' },

  -- JS indentation and highlighting
  { 'pangloss/vim-javascript' },
  { 'MaxMEllon/vim-jsx-pretty' },

  -- TS integration
  { 'leafgarland/typescript-vim' },
  { 'peitalin/vim-jsx-typescript' },

  -- Ruby on Rails integration
  { 'tpope/vim-rails' },

  -- Ruby integration
  { 'vim-ruby/vim-ruby' },

  -- Go integration
  { 'fatih/vim-go' },

  -- Rust integration
  { 'rust-lang/rust.vim' },
  { 'simrat39/rust-tools.nvim' },

  -- Test helpers
  { 'vim-test/vim-test' },

  -- Store session
  { 'natecraddock/sessions.nvim' },

  -- Yaml support
  { 'Einenlum/yaml-revealer' },

  -- LSP
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'neovim/nvim-lspconfig' },

  -- LSP server loading indication
  {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    config = function()
      require('fidget').setup()
    end
  },

  -- Snippets support
  { 'L3MON4D3/LuaSnip' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'rafamadriz/friendly-snippets' },

  {
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
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- Multicursor
  { 'mg979/vim-visual-multi' },

  -- Copilot
  { 'github/copilot.vim' },

  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'LspAttach',
    config = function()
      require('tiny-inline-diagnostic').setup()
    end
  },

  -- Tmux integration
  {
    'aserowy/tmux.nvim',
    config = function() return require("tmux").setup() end
  }
}
