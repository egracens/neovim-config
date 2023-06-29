function Map(mode, keybinding, command, opts)
  local options = { noremap = true, silent = true }

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  vim.keymap.set(mode, keybinding, command, options)
end

vim.g.mapleader = ','

-- NvimTree
Map('n', '<leader>/', ':NvimTreeToggle<cr>')
Map('n', '<leader>nf', ':NvimTreeFindFile<cr>')

-- Telescope
Map('n', '<leader>ff', ':Telescope find_files<cr>')
Map('n', '<leader>fg', ':Telescope live_grep<cr>')
Map('n', '<leader>fc', ':Telescope git_status<cr>')
Map('n', '<leader>fr', ':Telescope resume<cr>')

-- Specs
Map('n', '<leader>tf', ':TestFile<cr>')
Map('n', '<leader>tt', ':TestNearest<cr>')
Map('n', '<leader>ts', ':TestSuite<cr>')
Map('n', '<leader>p', ':PromoteToLet<cr>')

-- Copy path to current file
Map('n', '<leader>cp', ':let @+=expand("%")<cr>')

-- Spectre
Map('n', '<leader>S', ":lua require('spectre').open()<cr>")

-- Lazy Git
Map('n', '<leader>lg', ":lua require('lazygit').lazygit()<CR>")

-- Navigation between split windows
Map("n", "<C-h>", "<C-w>h")
Map("n", "<C-j>", "<C-w>j")
Map("n", "<C-k>", "<C-w>k")
Map("n", "<C-l>", "<C-w>l")
Map("t", "<C-h>", "<cmd>wincmd h<CR>")
Map("t", "<C-j>", "<cmd>wincmd j<CR>")
Map("t", "<C-k>", "<cmd>wincmd k<CR>")
Map("t", "<C-l>", "<cmd>wincmd l<CR>")

-- Text movement in visual mode
-- horizontal
Map("v", "<", "<gv")
Map("v", ">", ">gv")
-- vertical
Map("v", "J", ":m '>+1<CR>gv=gv")
Map("v", "K", ":m '<-2<CR>gv=gv")

-- Scrolling improvements
Map("n", "<C-d>", "<C-d>zz")
Map("n", "<C-u>", "<C-u>zz")

-- Bind the function to F6 key
Map('n', '<F6>', 'ggVG=<C-o>', { noremap = true, silent = true })
Map('n', '<leader>rac', ':!rubocop -a %<CR>', { noremap = true, silent = true })

