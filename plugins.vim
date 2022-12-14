call plug#begin()
" Color Scheme
Plug 'morhetz/gruvbox' "https://github.com/morhetz/gruvbox

" Telescope. File finder with ability to preview.
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Barbar and icons for it. Pretty file tabs at top.
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

" Fancy status line at bottom of editor
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Nice File Tree
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Git Integration
Plug 'tpope/vim-fugitive'

" JS highlightin and indentation
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'

" TS highlightin and indentation
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Ruby on Rails integration
Plug 'tpope/vim-rails'

" Ruby integration
Plug 'vim-ruby/vim-ruby'

" Test helpers
Plug 'vim-test/vim-test'

" Hard Mode
Plug 'dusans/vim-hardmode'

" Store Session
Plug 'natecraddock/sessions.nvim'

" Notes
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vim-zettel'

" Yaml support
Plug 'Einenlum/yaml-revealer'

" LSP
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" Code suggestions dropdown
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

call plug#end()
