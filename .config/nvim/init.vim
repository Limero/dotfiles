set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

set laststatus=0

lua require('gitsigns').setup()
lua require('completion')
lua require('lsp')
lua require('format')
