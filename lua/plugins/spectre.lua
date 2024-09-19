-- Search and replace
return {
  'windwp/nvim-spectre',
  requires = { 'nvim-lua/plenary.nvim' },
  config = function ()
    require('spectre').setup({
      finder_cmd='ag',
      find_engine = {
        ['rg'] = {
          cmd = "rg",
          args = {
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--pcre2'
          } ,
          options = {
            ['ignore-case'] = {
              value= "--ignore-case",
              icon="[I]",
              desc="ignore case"
            },
            ['hidden'] = {
              value="--hidden",
              desc="hidden file",
              icon="[H]"
            },
          }
        },
      },
    })
  end
}
