vim.keymap.set('n', '<C-B>', ':buffers<CR>:buffer<Space>') -- Navigate buffers

-- Replace a word with yanked text in visual mode
-- http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text#Mapping_for_paste
vim.keymap.set('x', 'p', '"_dP')

vim.keymap.set('i', '{<CR>', '{<CR>}<ESC>O') -- Automatically add closing curly brace
vim.keymap.set('i', '(<CR>', '(<CR>)<ESC>O') -- Automatically add closing parenthesis

-- Yank file name/path of current buffer
-- https://stackoverflow.com/questions/916875/yank-file-name-path-of-current-buffer-in-vim
-- https://stackoverflow.com/questions/4525261/getting-relative-paths-in-vim/24463362#24463362
vim.keymap.set('n', 'yp', [[:let @+ = expand("%:~:.")<CR>]])
vim.keymap.set('n', 'yfp', [[:let @+ = expand("%:p")<CR>]])
vim.keymap.set('n', 'yd', [[:let @+ = expand("%:h:.").'/'<CR>]])
