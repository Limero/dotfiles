-- Disable continuation of comments
vim.cmd('autocmd FileType * setlocal formatoptions-=cro')

-- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
vim.cmd('autocmd FocusGained,BufEnter * :checktime')
vim.cmd([[
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
]])
