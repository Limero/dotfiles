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

-- Split selection by comma
vim.api.nvim_set_keymap('x', '<Leader>s', ":s/,/,\\r/g<CR>:w<CR>", opts)

-- Automatically add closing curly brace and parenthesis in insert mode
vim.api.nvim_set_keymap('i', '{<CR>', '{<CR>}<ESC>O', opts)
vim.api.nvim_set_keymap('i', '(<CR>', '(<CR>)<ESC>O', opts)

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

-- Experimental
vim.api.nvim_set_keymap('n', '<C-n>', ':cn<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>t', ':tabe %<CR>:tabp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>s', ':vsp %<CR><C-w>p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>d', ':bd<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Tab>', ':bp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bn<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>e', ':Vex<CR>', { noremap = true, silent = true })
