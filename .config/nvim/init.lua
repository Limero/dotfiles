vim.cmd('let &packpath = &runtimepath')
vim.cmd('source ~/.vimrc')

if vim.fn.executable('fzf') == 1 then
  vim.keymap.set('n', '<C-P>',
  [[<Cmd>call fzf#run({"source": "git ls-files --exclude-standard --cached --others \|\| find -L -type f -printf '%P\n'", "sink": "edit", "options": "--reverse --preview 'cat {}'"})<CR><CR>]]
  )
  vim.keymap.set('n', '<C-B>', '<Cmd>Buffers<CR>')
end

vim.cmd([[
  call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'wellle/context.vim'
  call plug#end()
]])

vim.cmd('tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\\><c-n>"')

require('gitsigns').setup()
require('lsp')
