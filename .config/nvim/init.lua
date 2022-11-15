vim.cmd([[
  let &packpath = &runtimepath
  source ~/.vimrc

  call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'wellle/context.vim'
  call plug#end()
]])

require('gitsigns').setup()
require('lsp')
