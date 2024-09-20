_G.keys = _G.keys or {}

function keys.Map(mode, keybinding, command, opts)
  local options = { noremap = true, silent = true }

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  vim.keymap.set(mode, keybinding, command, options)
end

vim.g.mapleader = ','

-- NvimTree
keys.Map('n', '<leader>/', ':NvimTreeToggle<cr>')
keys.Map('n', '<leader>nf', ':NvimTreeFindFile<cr>')

-- LazyGit
keys.Map('n', '<leader>lg', ":lua require('lazygit').lazygit()<CR>")

-- Telescope
keys.Map('n', '<leader>ff', ':Telescope find_files hidden=true<cr>')
keys.Map('n', '<leader>fg', ':Telescope live_grep<cr>')
keys.Map('n', '<leader>fc', ':Telescope git_status<cr>')
keys.Map('n', '<leader>fr', ':Telescope resume<cr>')

-- Specs
keys.Map('n', '<leader>tf', ':TestFile<cr>')
keys.Map('n', '<leader>tt', ':TestNearest<cr>')
keys.Map('n', '<leader>ts', ':TestSuite<cr>')
keys.Map('n', '<leader>p', ':PromoteToLet<cr>')

-- Copy path to current file
keys.Map('n', '<leader>cp', ':let @+=expand("%:.")<cr>')

-- Spectre
keys.Map('n', '<leader>S', ":lua require('spectre').open()<cr>")

-- Navigation between split windows
require("tmux").setup()
keys.Map("n", "<C-h>", [[<cmd>lua require("tmux").move_left()<cr>]])
keys.Map("n", "<C-j>", [[<cmd>lua require("tmux").move_bottom()<cr>]])
keys.Map("n", "<C-k>", [[<cmd>lua require("tmux").move_top()<cr>]])
keys.Map("n", "<C-l>", [[<cmd>lua require("tmux").move_right()<cr>]])
keys.Map("t", "<C-h>", "<cmd>wincmd h<CR>")
keys.Map("t", "<C-j>", "<cmd>wincmd j<CR>")
keys.Map("t", "<C-k>", "<cmd>wincmd k<CR>")
keys.Map("t", "<C-l>", "<cmd>wincmd l<CR>")

-- Disallow copying of deleted text
keys.Map("v", "d", '"_d')

-- Text movement in visual mode
-- horizontal
keys.Map("v", "<", "<gv")
keys.Map("v", ">", ">gv")
-- vertical
keys.Map("v", "J", ":m '>+1<CR>gv=gv")
keys.Map("v", "K", ":m '<-2<CR>gv=gv")

-- Scrolling improvements
keys.Map("n", "<C-d>", "<C-d>zz")
keys.Map("n", "<C-u>", "<C-u>zz")

-- Select all text
keys.Map('n', '<F6>', 'ggVG=<C-o>', { noremap = true, silent = true })

-- Autocorrect code
keys.Map('n', '<leader>rac', ':Format<CR>', { noremap = true, silent = true })

-- Turn off search highlighting
keys.Map('n', '<F3>', ':noh<CR>')

-- Copilot
keys.Map('i', '<A-Right>', '<Plug>(copilot-next)')
keys.Map('i', '<A-Left>', '<Plug>(copilot-previous)')

vim.keymap.set('n', '<leader>ccq', function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end, bufopts)

local function set_copilot_keymap(key, action)
  vim.keymap.set('n', key, function()
    local actions = require("CopilotChat.actions")
    require("CopilotChat.integrations.telescope").pick(actions[action]())
  end, bufopts)
end

set_copilot_keymap('<leader>ccp', 'help_actions')
set_copilot_keymap('<leader>cch', 'prompt_actions')
