vim.opt_local.tabstop = 4
vim.opt.listchars = {
  tab = '  ',
  nbsp = '%',
  trail = '·',
}

-- will be default in 0.11
vim.opt.expandtab = false

vim.keymap.set('n', 'yt', function()
  local testLine = vim.fn.getline('.'):match('func%s+([%w_]+)')
  if testLine then
    vim.fn.setreg('+', "go test -run ^" .. testLine .. "$ " .. vim.fn.expand("%:p:h"))
  else
    vim.fn.setreg('+', "go test " .. vim.fn.expand("%:p:h"))
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

local path = vim.fs.find({ "go.mod" }, { type = "file" })
vim.lsp.start({
  name = "gopls",
  cmd = { "gopls", "serve" },
  root_dir = vim.fs.dirname(path[1]),
  on_init = function(client)
    vim.notify("Loading gopls...", vim.log.levels.WARN)
    vim.api.nvim_create_autocmd("DiagnosticChanged",
      { pattern = "*", callback = function() vim.notify("") end, once = true })
  end,
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
