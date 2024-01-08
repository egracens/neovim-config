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
require("tmux").setup()
Map("n", "<C-h>", [[<cmd>lua require("tmux").move_left()<cr>]])
Map("n", "<C-j>", [[<cmd>lua require("tmux").move_bottom()<cr>]])
Map("n", "<C-k>", [[<cmd>lua require("tmux").move_top()<cr>]])
Map("n", "<C-l>", [[<cmd>lua require("tmux").move_right()<cr>]])
Map("t", "<C-h>", "<cmd>wincmd h<CR>")
Map("t", "<C-j>", "<cmd>wincmd j<CR>")
Map("t", "<C-k>", "<cmd>wincmd k<CR>")
Map("t", "<C-l>", "<cmd>wincmd l<CR>")

-- Disallow copying of deleted text
Map("v", "d", '"_d')

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

-- Select all text
Map('n', '<F6>', 'ggVG=<C-o>', { noremap = true, silent = true })

-- Autocorrect code
Map('n', '<leader>rac', ':Format<CR>', { noremap = true, silent = true })

-- Turn off search highlighting
Map('n', '<F3>', ':noh<CR>')

-- Copilot
Map('i', '<A-Right>', '<Plug>(copilot-next)')
Map('i', '<A-Left>', '<Plug>(copilot-previous)')
