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

" --- Coc ---
" Show tooltip on TAB key press
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Show tooltip for word over cursor
nnoremap <silent> K :call CocAction('doHover')<CR>
" Go to definition
nmap <silent> gd <Plug>(coc-definition)
" Go to type definition
nmap <silent> gy <Plug>(coc-type-definition)
" Show references
nmap <silent> gr <Plug>(coc-references)
" Navigation between errors
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Show suggested actions
nmap <leader>do <Plug>(coc-codeaction)
" Intelligent rename
nmap <leader>rn <Plug>(coc-rename)

" --- Vim-Rails ---
" gf - magic command (go to file, partial, view, model, relation etc)
" :E<tab> - many helper commands
" :A :AV :AS - go to test for current file
"

" --- Vim-test ---
map ,tf :TestFile<cr>
map ,tt :TestNearest<cr>
map ,ts :TestSuite<cr>
map <leader>p :PromoteToLet<cr>


" Refactoring
lua << EOF
-- Remaps for the refactoring operations currently offered by the plugin
vim.api.nvim_set_keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

-- Extract block doesn't need visual mode
vim.api.nvim_set_keymap("n", "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]], {noremap = true, silent = true, expr = false})

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.api.nvim_set_keymap("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

EOF
