return {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_dir = vim.fs.root(0, 'go.mod'),
  settings = {
    ['gopls'] = {
      analyses = {
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        shadow = true,
        ST1000 = false,
      },
      gofumpt = true,
      staticcheck = true,
    },
  },
}
