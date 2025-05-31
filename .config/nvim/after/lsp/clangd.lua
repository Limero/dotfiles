return {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
  root_dir = vim.fs.root(0, '.clang-format'),
}
