-- Disable continuation of comments
vim.cmd("setlocal formatoptions-=cro")

vim.lsp.start({
  name = "clangd",
  cmd = { "clangd" },
  root_dir = vim.fs.root(0, '.clang-format'),
  settings = {
    ["clangd"] = {
    },
  },
})
