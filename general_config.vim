" Set key mappings for russian keys
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
" Show the line number
set number

" Enable Syntax Highlighting
syntax enable

" Enable using the mouse to click or select some peace of code
set mouse=a

" Set the Tab to 2 spaces
set tabstop=2
set shiftwidth=2

" Convert tabs to spaces. Count of spaces per tab declared above.
set expandtab 

" Clipboard compatibility for WSL
set clipboard=unnamedplus

" Allow background buffers
set hidden

" Disable backup files
set nobackup

" Disable swap files
set noswapfile

" Colors
set termguicolors
set background=dark
colorscheme gruvbox

" Moves cursor to next/previous line when navigation on current line impossible
set ww+=<,>,[,],h,l

" Auto Indentation
set ai

" vimwiki asks to set it up
set nocompatible
filetype plugin on

" Automatically remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e
