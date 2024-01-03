vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt.listchars = {
  tab = '  ',
  nbsp = '%',
  trail = '·',
}
vim.opt.expandtab = false

vim.keymap.set('n', 'yt', function()
  local testLine = vim.fn.getline('.'):match('func%s+([%w_]+)')
  if testLine then
    vim.fn.setreg('+', "go test -run ^" .. testLine .. "$ " .. vim.fn.expand("%:p:h"))
  else
    vim.fn.setreg('+', "go test " .. vim.fn.expand("%:p:h"))
  end
end)

local path = vim.fs.find({ "go.mod" }, { type = "file" })
vim.lsp.start({
  name = "gopls",
  cmd = { "gopls", "serve" },
  root_dir = vim.fs.dirname(path[1]),
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
