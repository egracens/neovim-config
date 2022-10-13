call plug#begin()
" Color Scheme
Plug 'morhetz/gruvbox' "https://github.com/morhetz/gruvbox

" Auto completion. Looks deprecated. Research for updates.
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'

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

call plug#end()
