vim.api.nvim_set_keymap("n", "<leader>lg", [[ <Esc><Cmd>lua require('lazygit').lazygit()<CR>]], {noremap = true, silent = true, expr = false})
