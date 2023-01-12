vim.api.nvim_set_keymap("n", "<leader>S", [[ <Cmd>lua require('spectre').open()<CR>]], {noremap = true, expr = false})
