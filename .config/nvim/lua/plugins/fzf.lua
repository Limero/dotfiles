if vim.fn.executable('fzf') == 0 then
  return
end

if vim.fn.exists(":FZF") == 0 then
  if vim.fn.filereadable('/opt/homebrew/opt/fzf/plugin/fzf.vim') == 1 then
    vim.cmd('source /opt/homebrew/opt/fzf/plugin/fzf.vim')
  end
  if vim.fn.filereadable('/usr/share/vim/vimfiles/plugin/fzf.vim') == 1 then
    vim.cmd('source /usr/share/vim/vimfiles/plugin/fzf.vim')
  end
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
