vim.opt_local.tabstop = 4
vim.opt.listchars = {
  tab = '  ',
  nbsp = '%',
  trail = '·',
}

-- will be default in 0.11
vim.opt.expandtab = false

vim.keymap.set('n', 'yt', function()
  local dirPath = vim.fn.expand("%:p:h"):gsub('^/var', '')
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

vim.lsp.start({
  name = "gopls",
  cmd = { "gopls", "serve" },
  root_dir = vim.fs.root(0, 'go.mod'),
  on_init = LoadingMessage,
  settings = {
    ["gopls"] = {
      analyses = {
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        shadow = true,
      },
      gofumpt = true,
      staticcheck = true,
    },
  },
})
