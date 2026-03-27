vim.pack.add({
  'https://github.com/junegunn/fzf.vim',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/github/copilot.vim'
})

vim.g.copilot_filetypes = {
  ['*'] = false,
  ['go'] = true,
}

require('plugins.gitsigns')
require('plugins.fzf')

vim.cmd('packadd cfilter')
