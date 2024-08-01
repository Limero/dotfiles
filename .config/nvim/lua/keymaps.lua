-- Find files and navigate buffers, will be overriden by fzf if available
vim.keymap.set('n', '<C-P>', ':tabfind *<CR>')
vim.keymap.set('n', '<C-B>', ':buffers<CR>:buffer<Space>')

-- Replace a word with yanked text in visual mode
-- http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text#Mapping_for_paste
vim.keymap.set('x', 'p', '"_dP')

-- Keep selected text selected when fixing indentation
vim.keymap.set('x', '<', '<gv')
vim.keymap.set('x', '>', '>gv')

-- Automatically add closing curly brace and parenthesis in insert mode
vim.keymap.set('i', '{<CR>', '{<CR>}<ESC>O')
vim.keymap.set('i', '(<CR>', '(<CR>)<ESC>O')

-- Pane navigation
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l')

-- Yank file name/path of current buffer
-- https://stackoverflow.com/questions/916875/yank-file-name-path-of-current-buffer-in-vim
-- https://stackoverflow.com/questions/4525261/getting-relative-paths-in-vim/24463362#24463362
vim.keymap.set('n', 'yp', [[:let @+ = expand("%:~:.")<CR>]])
vim.keymap.set('n', 'yfp', [[:let @+ = expand("%:p")<CR>]])
vim.keymap.set('n', 'yd', [[:let @+ = expand("%:h:.").'/'<CR>]])

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Experimental
vim.keymap.set('n', '<C-n>', ':cn<CR>')
vim.keymap.set('n', '<Leader>t', ':tabe %<CR>:tabp<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>s', ':vsp %<CR><C-w>p', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>d', ':bd<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>e', ':Vex<CR>', { noremap = true, silent = true })
