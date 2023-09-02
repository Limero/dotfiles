-- Disable continuation of comments
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

local path = vim.fs.find({ ".clang-format" }, { type = "file" })
vim.lsp.start({
  name = "clangd",
  cmd = { "clangd" },
  root_dir = vim.fs.dirname(path[1]),
  settings = {
    ["clangd"] = {
    },
  },
})
