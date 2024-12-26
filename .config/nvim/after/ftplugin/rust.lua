if vim.fn.executable('rust-analyzer') == 0 then
  print('rust-analyzer is missing')
  return
end

vim.lsp.start({
  name = "rust-analyzer",
  cmd = { "rust-analyzer" },
  root_dir = vim.fs.root(0, 'Cargo.toml'),
  on_init = LoadingMessage,
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
    },
  },
})
