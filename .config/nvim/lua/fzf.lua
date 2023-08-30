if vim.fn.executable('fzf') == 0 then
  return
end

if vim.fn.exists(":FZF") == 0 then
  vim.cmd('source /opt/homebrew/opt/fzf/plugin/fzf.vim')
end

vim.keymap.set('n', '<C-P>', function()
  vim.fn['fzf#run']({
    source = "git ls-files --exclude-standard --cached --others -- . ':!mocks' ':!**/go-client/*'",
    sink = "tabedit",
    options = "--reverse --preview 'cat {}'",
  })
end)

vim.keymap.set('n', '<C-B>', '<Cmd>Buffers<CR>')

vim.cmd('tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\\><c-n>"')
