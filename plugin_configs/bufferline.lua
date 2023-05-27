vim.opt.termguicolors = true

require("bufferline").setup{
  options = {
    diagnostics = "nvim_lsp",
    numbers = "ordinal",
    offsets = {
      {
        filetype = "NvimTree",
        highlight = "Directory",
        text_align = "center",
        text = function()
          return 'Neovim Tree'
        end,
      }
    },
    groups = {
      options = {
        toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
      },
      items = {
        {
          name = "Ruby",
          priority = 1,
          matcher = function(buf) -- Mandatory
            return buf.filename:match('%.rb') and not buf.filename:match('%_spec')
          end,
        },
        {
          name = "JS",
          priority = 2,
          matcher = function(buf)
            return buf.filename:match('%.js') or buf.filename:match('%.jsx')
          end,
        },
        {
          name = "Tests",
          priority = 3,         matcher = function(buf) -- Mandatory
            return buf.filename:match('%_test') or buf.filename:match('%_spec')
          end,
        }
      }
    }
  }
}

local function table_length(t)
  local count = 0
  for _ in pairs(t) do count = count + 1 end
  return count
end

function _G.close_and_go_to_next()
  local openBuffers = require("bufferline").get_elements().elements
  local openBuffersCount = table_length(openBuffers)
  local currentBufferId = vim.api.nvim_get_current_buf()
  local currentBufferIndex = -1

  for index, currentBuffer in pairs(openBuffers) do
    if currentBufferId == currentBuffer.id then
      currentBufferIndex = index
    end
  end

  vim.schedule(function()
    if openBuffersCount == 1 then

    elseif currentBufferIndex == 1 then
      require('bufferline').go_to_buffer(2)
    elseif currentBufferIndex == openBuffersCount then
      require('bufferline').go_to_buffer(openBuffersCount - 1)
    else
      require('bufferline').go_to_buffer(currentBufferIndex + 1)
    end

    vim.cmd("bd " .. currentBufferId)
  end)
end

vim.api.nvim_set_keymap("n", "<A-1>", [[ <Esc><Cmd>lua require('bufferline').go_to_buffer(1, true)<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<A-2>", [[ <Esc><Cmd>lua require('bufferline').go_to_buffer(2, true)<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<A-3>", [[ <Esc><Cmd>lua require('bufferline').go_to_buffer(3, true)<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<A-4>", [[ <Esc><Cmd>lua require('bufferline').go_to_buffer(4, true)<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<A-5>", [[ <Esc><Cmd>lua require('bufferline').go_to_buffer(5, true)<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<A-6>", [[ <Esc><Cmd>lua require('bufferline').go_to_buffer(6, true)<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<A-7>", [[ <Esc><Cmd>lua require('bufferline').go_to_buffer(7, true)<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<A-8>", [[ <Esc><Cmd>lua require('bufferline').go_to_buffer(8, true)<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<A-9>", [[ <Esc><Cmd>lua require('bufferline').go_to_buffer(9, true)<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<A-0>", [[ <Esc><Cmd>lua require('bufferline').go_to_buffer(10, true)<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<A-c>", [[ <Esc><Cmd>lua _G.close_and_go_to_next()<CR>]], {noremap = true, silent = true, expr = false})

vim.api.nvim_set_keymap("n", "<A-C>", [[ <Esc><Cmd>lua require('bufferline').go_to_buffer(10, true)<CR>]], {noremap = true, silent = true, expr = false})
