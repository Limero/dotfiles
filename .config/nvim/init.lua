vim.cmd('let &packpath = &runtimepath')
vim.cmd('source ~/.vimrc')

require('plugins')
if vim.fn.executable('fzf') == 1 then
  require('fzf')
end
require('gitsigns').setup()
require('lsp')
