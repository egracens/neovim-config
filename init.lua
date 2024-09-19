-- Load plugins
require('plugins')

-- Load plugin configurations
require('plugin_configs.bufferline')
require('plugin_configs.indent-blankline')
require('plugin_configs.nvim-tree')
require('plugin_configs.telescope')
require('plugin_configs.nvim-cmp')
require('plugin_configs.lsp')
require('plugin_configs.treesitter')
require('plugin_configs.lualine')
require('plugin_configs.fidget')
require('plugin_configs.spectre')
require('plugin_configs.nvim-scrollbar')
require('plugin_configs.nvim-hlslens')
require('plugin_configs.formatter')

-- Load general configuration
require('general_config')

-- Load key mappings
require('key_mappings.general')
