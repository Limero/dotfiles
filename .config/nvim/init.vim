set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

set laststatus=0

" hide commandline when not in use
lua vim.o.ch = 0

lua require('gitsigns').setup()
