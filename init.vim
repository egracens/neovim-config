source ~/.config/nvim/plugins.vim
source ~/.config/nvim/key_mappings.vim

for f in glob('~/.config/nvim/plugin_configs/*.vim', 0, 1)
  execute 'source' f
endfor

source ~/.config/nvim/experimental_configs/vsnip.vim

source ~/.config/nvim/general_config.vim
