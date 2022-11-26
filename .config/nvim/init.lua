vim.cmd([[
  let &packpath = &runtimepath
  source ~/.vimrc
]])

vim.cmd([[
  if executable('fzf')
    nnoremap <C-P> :call fzf#run({"source": "git ls-files --exclude-standard --cached --others \|\| find -L -type f -printf '%P\n'", "sink": "edit", "options": "--reverse --preview 'cat {}'"})<CR><CR>
    "nnoremap <C-P> :FZF<CR>
    nnoremap <C-B> :Buffers<CR>
  endif
]])

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
