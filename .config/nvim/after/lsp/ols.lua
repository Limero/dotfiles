return {
  cmd = { 'ols' },
  filetypes = { 'odin' },
  root_dir = vim.fs.root(0, { 'ols.json', '.git', '*.odin' }),
  init_options = {
    enable_semantic_tokens = true,
    enable_auto_import = true,
    odin_command = '~/Odin/odin',
  },
}
