return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_dir = vim.fs.root(0, { 'init.lua', '.git' }),
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      telemetry = {
        enable = false,
      },
      workspace = {
        library = { vim.env.VIMRUNTIME }
      },
    },
  },
  single_file_support = true,
}
