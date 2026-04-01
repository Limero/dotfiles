vim.api.nvim_create_user_command('FormatJSON', function()
  vim.cmd([[%s/\\n//ge]])  -- remove \n
  vim.cmd([[%s/\\"/"/ge]]) -- replace \" with "
  vim.cmd([[%s/"{/{/ge]])  -- remove " before {
  vim.cmd([[%s/}"/}/ge]])  -- remove " after }

  -- https://coderwall.com/p/faceag/format-json-in-vim
  vim.cmd("%!python3 -m json.tool | sed 's/    /  /g'")
end, { desc = 'Format JSON' })

vim.opt.grepprg = 'rg --vimgrep --no-heading --smart-case -g "!{mocks,CHANGELOG.md,CODEOWNERS,go.sum}"'
vim.api.nvim_create_user_command('G', function(opts)
  local grep_args = vim.fn.shellescape(vim.fn.escape(opts.args, '*{[()\\'), true)
  vim.cmd(string.format('silent grep! %s | copen 25', grep_args))

  if vim.fn.empty(vim.fn.getqflist()) == 1 then
    vim.cmd('cclose')
    print('No results for', grep_args)
  end
end, { nargs = '+', desc = 'Grep' })

-- Typos
vim.api.nvim_create_user_command('WQ', 'wq', { bang = true })
vim.api.nvim_create_user_command('Wq', 'wq', { bang = true })
vim.api.nvim_create_user_command('W', 'w', { bang = true })
vim.api.nvim_create_user_command('Q', 'q', { bang = true })
vim.api.nvim_create_user_command('Qa', 'qa', { bang = true })
