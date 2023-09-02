local path = vim.fs.find({ "init.lua", ".git" }, { type = "file" })
vim.lsp.start({
  name = "lua_ls",
  cmd = { "lua-language-server" },
  root_dir = vim.fs.dirname(path[1]),
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
