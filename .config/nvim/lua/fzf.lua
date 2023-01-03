vim.keymap.set('n', '<C-P>',
  [[<Cmd>call fzf#run({"source": "git ls-files --exclude-standard --cached --others", "sink": "edit", "options": "--reverse --preview 'cat {}'"})<CR>]]
  )
vim.keymap.set('n', '<C-B>', '<Cmd>Buffers<CR>')

vim.cmd('tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\\><c-n>"')
