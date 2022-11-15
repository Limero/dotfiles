vim.cmd([[
  let &packpath = &runtimepath
  source ~/.vimrc

  if executable('fzf')
    nnoremap <C-P> :call fzf#run({"source": "git ls-files --exclude-standard --cached --others \|\| find -L -type f -printf '%P\n'", "sink": "edit", "options": "--reverse --preview 'cat {}'"})<CR><CR>
    autocmd! FileType fzf
    autocmd  FileType fzf set norelativenumber noshowmode noruler
      \| autocmd BufLeave <buffer> set showmode ruler
    "nnoremap <C-P> :FZF<CR>
    nnoremap <C-B> :Buffers<CR>
  endif

  call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'wellle/context.vim'
  call plug#end()
]])

require('gitsigns').setup()
require('lsp')
