vim.keymap.set('n', '<C-B>', ':buffers<CR>:buffer<Space>') -- Navigate buffers

-- Replace a word with yanked text in visual mode
-- http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text#Mapping_for_paste
vim.keymap.set('x', 'p', '"_dP')

vim.keymap.set('i', '{<CR>', '{<CR>}<ESC>O') -- Automatically add closing curly brace
vim.keymap.set('i', '(<CR>', '(<CR>)<ESC>O') -- Automatically add closing parenthesis

-- Put relative path of current buffer's file in clipboard
vim.keymap.set('n', 'yp', function()
  vim.fn.setreg('+', vim.fn.expand('%:~:.'))
end)

-- Put relative path and cursor line number of current buffer's file in clipboard
vim.keymap.set('n', 'yrr', function()
  vim.fn.setreg('+', vim.fn.expand('%:~:.')..':'..vim.api.nvim_win_get_cursor(0)[1])
end)

-- Put full path of current buffer's file in clipboard
vim.keymap.set('n', 'yfp', function()
  vim.fn.setreg('+', vim.fn.expand('%:p'))
end)

-- Put relative path of current buffer's directory in clipboard
vim.keymap.set('n', 'yd', function()
  vim.fn.setreg('+', vim.fn.expand('%:h:.'))
end)

-- Put GitHub/GitLab link to buffer's file in clipboard
vim.keymap.set('n', 'ygg', function()
  local git_branch = vim.fn.system('git branch --show-current'):gsub('\n', '')
  local url = 'https://'..vim.fn.system("git remote get-url origin 2>/dev/null")
    :gsub('\n', '')
    :gsub('^.-@', '', 1)
    :gsub(':', '/', 1)
    :gsub('%.git$', '/blob/'..git_branch..'/'..vim.fn.expand('%:~:.'))
  vim.fn.setreg('+', url)
end)
