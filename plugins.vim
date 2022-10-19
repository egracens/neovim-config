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

" Autocomplete for JS. Not configured.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git Integration
Plug 'tpope/vim-fugitive'

" JS highlightin and indentation
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'

" TS highlightin and indentation
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Coc - Language server for JS and TS. Maybe setup it for Ruby?
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

call plug#end()
