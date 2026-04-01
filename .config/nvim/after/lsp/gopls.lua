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
      },
      gofumpt = true,
      staticcheck = true,
    },
  },
}
