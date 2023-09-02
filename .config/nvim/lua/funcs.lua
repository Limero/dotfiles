-- https://coderwall.com/p/faceag/format-json-in-vim
vim.cmd('com! FormatJSON %!python3 -m json.tool')

-- Grep
vim.cmd([[
command -nargs=? G vimgrep /<args>/j **/* | copen 25
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ -g\ '!{mocks,CHANGELOG.md,CODEOWNERS,go.sum}'
  command! -nargs=+ G execute 'silent grep! ' . shellescape(escape('<args>', '*{[()\'), 1) . ' | copen 25'
endif
nnoremap \| :G<Space>
]])

-- GitBlame function
-- https://stackoverflow.com/questions/33051496/custom-script-for-git-blame-from-vim
vim.cmd('command! -nargs=* GB call v:lua.GitBlame()')
function _G.GitBlame()
  local cmdline = "git blame -w " .. vim.fn.expand("%:p")
  local nline = vim.fn.line(".") + 1
  vim.cmd('botright new')
  vim.cmd('setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap cursorline')
  vim.cmd('$read !' .. cmdline)
  vim.bo.modifiable = false
  vim.cmd('normal ' .. nline .. 'gg')
end
