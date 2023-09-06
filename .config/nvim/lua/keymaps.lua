local opts = { noremap = true }

-- Find files and navigate buffers, will be overriden by fzf if available
vim.api.nvim_set_keymap('n', '<C-P>', ':tabfind *<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-B>', ':buffers<CR>:buffer<Space>', opts)

-- Replace a word with yanked text in visual mode
-- http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text#Mapping_for_paste
vim.api.nvim_set_keymap('x', 'p', '"_dP', opts)

-- Keep selected text selected when fixing indentation
vim.api.nvim_set_keymap('x', '<', '<gv', opts)
vim.api.nvim_set_keymap('x', '>', '>gv', opts)

-- Automatically add closing curly brace in insert mode
vim.api.nvim_set_keymap('i', '{<CR>', '{<CR>}<ESC>O', opts)

-- Pane navigation
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', opts)
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', opts)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', opts)
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-n><C-w>j', opts)
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n><C-w>k', opts)
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n><C-w>h', opts)
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-n><C-w>l', opts)

-- Yank file name/path of current buffer
-- https://stackoverflow.com/questions/916875/yank-file-name-path-of-current-buffer-in-vim
-- https://stackoverflow.com/questions/4525261/getting-relative-paths-in-vim/24463362#24463362
vim.api.nvim_set_keymap('n', 'yp', [[:let @+ = expand("%:~:.")<CR>]], opts)
vim.api.nvim_set_keymap('n', 'yfp', [[:let @+ = expand("%:p")<CR>]], opts)
vim.api.nvim_set_keymap('n', 'yd', [[:let @+ = expand("%:h:.").'/'<CR>]], opts)
