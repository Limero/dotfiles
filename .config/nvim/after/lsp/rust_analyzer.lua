return {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_dir = vim.fs.root(0, 'Cargo.toml'),
  settings = {
    ['rust-analyzer'] = {
      cargo = { allFeatures = true },
    },
  },
}
