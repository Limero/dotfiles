if vim.fn.exists(':FZF') == 0 then
  if vim.fn.filereadable('/usr/share/vim/vimfiles/plugin/fzf.vim') == 1 then
    vim.cmd('source /usr/share/vim/vimfiles/plugin/fzf.vim') -- Fedora
  elseif vim.fn.filereadable('/opt/homebrew/opt/fzf/plugin/fzf.vim') == 1 then
    vim.cmd('source /opt/homebrew/opt/fzf/plugin/fzf.vim')   -- macOS
  elseif vim.fn.filereadable('/usr/share/doc/fzf/examples/fzf.vim') == 1 then
    vim.cmd('source /usr/share/doc/fzf/examples/fzf.vim')    -- Debian
  end
end

vim.keymap.set('n', '<C-P>', function()
  vim.fn['fzf#run']({
    source = "git ls-files --exclude-standard --cached --others -- . ':!mocks' ':!**/go-client/*'",
    sink = 'tabedit',
    options = "--exact --reverse --preview 'cat {}'",
  })
end)
