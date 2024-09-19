-- Set key mappings for Russian keys
vim.opt.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'

-- Show the line number
vim.opt.number = true

-- Show relative line numbers
vim.opt.relativenumber = true

-- Enable Syntax Highlighting
vim.cmd('syntax enable')

-- Enable using the mouse to click or select some piece of code
vim.opt.mouse = 'a'

-- Set the Tab to 2 spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Convert tabs to spaces. Count of spaces per tab declared above.
vim.opt.expandtab = true

-- Clipboard compatibility for WSL
vim.opt.clipboard = 'unnamedplus'

-- Allow background buffers
vim.opt.hidden = true

-- Disable backup files
vim.opt.backup = false

-- Disable swap files
vim.opt.swapfile = false

-- Colors
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.cmd('colorscheme gruvbox')

-- Moves cursor to next/previous line when navigation on current line impossible
vim.opt.whichwrap:append('<,>,[,],h,l')

-- Auto Indentation
vim.opt.autoindent = true

-- Automatically remove trailing whitespaces
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  command = [[%s/\s\+$//e]]
})

-- Set zsh as default shell
vim.opt.shell = 'zsh'
vim.opt.shellcmdflag = '-i'

vim.diagnostic.config({ virtual_text = false })
