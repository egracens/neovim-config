-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set(
  "n",
  "<leader>cp",
  ':let @+=expand("%:.")<cr>',
  { desc = "Copy file name to clipboard (relative to cwd)" }
)

vim.keymap.set("n", "<leader>grv", function()
  require("config.rails").open_view()
end, { desc = "Go to Rails view" })

vim.keymap.set("n", "<leader>grc", function()
  require("config.rails").open_controller()
end, { desc = "Go to Rails controller" })
