-- Find files and navigate buffers, will be overriden by fzf if available
vim.api.nvim_set_keymap('n', '<C-P>', ':tabfind *<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-B>', ':buffers<CR>:buffer<Space>', { noremap = true })

-- Replace a word with yanked text in visual mode
-- http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text#Mapping_for_paste
vim.api.nvim_set_keymap('x', 'p', '"_dP', { noremap = true })

-- Keep selected text selected when fixing indentation
vim.api.nvim_set_keymap('x', '<', '<gv', { noremap = true })
vim.api.nvim_set_keymap('x', '>', '>gv', { noremap = true })

-- Automatically add closing curly brace in insert mode
vim.api.nvim_set_keymap('i', '{<CR>', '{<CR>}<ESC>O', { noremap = true })

-- Yank file name/path of current buffer
-- https://stackoverflow.com/questions/916875/yank-file-name-path-of-current-buffer-in-vim
-- https://stackoverflow.com/questions/4525261/getting-relative-paths-in-vim/24463362#24463362
vim.api.nvim_set_keymap('n', 'yp', [[:let @+ = expand("%:~:.")<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', 'yfp', [[:let @+ = expand("%:p")<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', 'yd', [[:let @+ = expand("%:h:.").'/'<CR>]], { noremap = true })
