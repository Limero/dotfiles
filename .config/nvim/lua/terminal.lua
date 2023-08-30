vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("New terminal created", {}),
  callback = function()
    vim.api.nvim_command("startinsert")
  end,
})
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("Terminal buffer entered", {}),
  callback = function()
    if vim.bo.buftype == 'terminal' then
      vim.api.nvim_command("startinsert")
    end
  end,
})
