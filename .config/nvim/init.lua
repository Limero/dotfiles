vim.cmd('let &packpath = &runtimepath')
vim.cmd('source ~/.vimrc')

require('terminal')
require('plugins')
require('lsp')
