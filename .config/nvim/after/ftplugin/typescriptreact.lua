if vim.fn.executable('typescript-language-server') == 0 then
  print('typescript-language-server is missing')
  return
end

vim.lsp.start({
  name = "tsserver",
  cmd = { "typescript-language-server", "--stdio" },
  root_dir = vim.fs.root(0, 'package.json'),
  on_init = LoadingMessage,
  settings = {},
})
