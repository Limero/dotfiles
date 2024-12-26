-- Disable continuation of comments
vim.cmd("setlocal formatoptions-=cro")

if vim.fn.executable('clangd') == 0 then
  print('clangd is missing')
  return
end

vim.lsp.start({
  name = "clangd",
  cmd = { "clangd" },
  root_dir = vim.fs.root(0, '.clang-format'),
  settings = {
    ["clangd"] = {
    },
  },
})
