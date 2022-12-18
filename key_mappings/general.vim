let mapleader=","

" --- NerdTree ---
" Open NerdTree
nnoremap <leader>/ :NvimTreeToggle<CR>
" Show current file in NerdTree
nnoremap <leader>nf :NvimTreeFindFile<CR>

" --- Telescope ---
" Find files
nnoremap <leader>ff <cmd>Telescope find_files<CR>
" Global find in files
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" Find in git changes
nnoremap <leader>fc <cmd>Telescope git_status<cr>

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

" ----- BarBar -----
" Move to previous/next
nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>

" Pin/unpin buffer
nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>

" Mac mappings
nnoremap <silent>    ¡ <Cmd>BufferGoto 1<CR>
nnoremap <silent>    ™ <Cmd>BufferGoto 2<CR>
nnoremap <silent>    £ <Cmd>BufferGoto 3<CR>
nnoremap <silent>    ¢ <Cmd>BufferGoto 4<CR>
nnoremap <silent>    ∞ <Cmd>BufferGoto 5<CR>
nnoremap <silent>    § <Cmd>BufferGoto 6<CR>
nnoremap <silent>    ¶ <Cmd>BufferGoto 7<CR>
nnoremap <silent>    • <Cmd>BufferGoto 8<CR>
nnoremap <silent>    ª <Cmd>BufferGoto 9<CR>
nnoremap <silent>    º <Cmd>BufferLast<CR>
nnoremap <silent>    ç <Cmd>BufferClose<CR>

nmap <leader>cp :let @+=expand("%")<CR>
