vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("Format on save", {}),
  callback = function()
    vim.api.nvim_command('normal gg=G')
    vim.cmd([[exe "normal \<C-o>"]])
  end,
})

