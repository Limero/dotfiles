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

        ST1000 = false, -- "Incorrect or missing package comment"
        ST1020 = false, -- "The documentation of an exported function should start with the function's name"
        ST1021 = false, -- "The documentation of an exported type should start with type's name"
      },
      gofumpt = true,
      staticcheck = true,
    },
  },
}
