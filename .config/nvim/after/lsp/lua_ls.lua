return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_dir = vim.fs.root(0, { 'init.lua', '.git' }),
  settings = {
    Lua = {
      format = {
        enable = true,
        defaultConfig = {
          quote_style = 'single',
        }
      },
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
