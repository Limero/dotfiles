-- Find files and navigate buffers, will be overriden by fzf if available
vim.keymap.set('n', '<C-P>', ':tabfind *<CR>')
vim.keymap.set('n', '<C-B>', ':buffers<CR>:buffer<Space>')

-- Replace a word with yanked text in visual mode
-- http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text#Mapping_for_paste
vim.keymap.set('x', 'p', '"_dP')

-- Automatically add closing curly brace and parenthesis in insert mode
vim.keymap.set('i', '{<CR>', '{<CR>}<ESC>O')
vim.keymap.set('i', '(<CR>', '(<CR>)<ESC>O')

-- Yank file name/path of current buffer
-- https://stackoverflow.com/questions/916875/yank-file-name-path-of-current-buffer-in-vim
-- https://stackoverflow.com/questions/4525261/getting-relative-paths-in-vim/24463362#24463362
vim.keymap.set('n', 'yp', [[:let @+ = expand("%:~:.")<CR>]])
vim.keymap.set('n', 'yfp', [[:let @+ = expand("%:p")<CR>]])
vim.keymap.set('n', 'yd', [[:let @+ = expand("%:h:.").'/'<CR>]])

-- Experimental
vim.keymap.set('n', '<C-n>', ':cn<CR>')
vim.keymap.set('n', 'T', ':tabe %<CR>:tabp<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>s', ':vsp %<CR><C-w>p', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>d', ':bd<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>e', ':Vex<CR>', { noremap = true, silent = true })
