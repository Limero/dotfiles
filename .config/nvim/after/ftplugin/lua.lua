-- Disable continuation of comments
vim.cmd("setlocal formatoptions-=cro")

if vim.fn.executable('lua-language-server') == 0 then
  print('lua-language-server is missing')
  return
end

vim.lsp.start({
  name = "lua_ls",
  cmd = { "lua-language-server" },
  root_dir = vim.fs.root(0, { 'init.lua', '.git' }),
  on_init = LoadingMessage,
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
})
