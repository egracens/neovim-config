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

lua << EOF
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fr', builtin.resume, {})
EOF

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


nmap <leader>cp :let @+=expand("%")<CR>
