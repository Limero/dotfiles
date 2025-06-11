vim.opt_local.tabstop = 4
vim.opt.listchars = {
  tab = '  ',
  nbsp = '%',
  trail = '·',
}

vim.keymap.set('n', 'yt', function()
  local dirPath = vim.fn.expand("%:p:h"):gsub('.*/go', '~/go')
  local testLine = vim.fn.getline('.'):match('func%s+([%w_]+)')
  if testLine then
    vim.fn.setreg('+', "go test -run ^" .. testLine .. "$ " .. dirPath)
  else
    vim.fn.setreg('+', "go test " .. dirPath)
  end
end)

vim.keymap.set('n', '<Leader>tt', function()
  local fileWithoutExt = vim.fn.expand('%:h') .. '/' .. vim.fn.expand('%:t:r')
  if string.match(fileWithoutExt, '_test$') then
    vim.cmd('edit ' .. fileWithoutExt:sub(1, -6) .. '.go')
  else
    vim.cmd('edit ' .. fileWithoutExt .. '_test.go')
  end
end)
