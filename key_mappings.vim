let mapleader=","

" --- NerdTree ---
" Open NerdTree
nnoremap <leader>/ :NERDTreeToggle<CR>
" Show current file in NerdTree
nnoremap <leader>nf :NERDTreeFind<CR>

" --- Telescope ---
" Find files
nnoremap <leader>ff <cmd>Telescope find_files<CR>
" Global find in files
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
