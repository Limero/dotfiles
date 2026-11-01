vim.pack.add({
  'https://github.com/lewis6991/gitsigns.nvim',
})

require('plugins.gitsigns')
require('plugins.fzf')

vim.cmd('packadd cfilter')
