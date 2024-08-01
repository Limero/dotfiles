function FormatJSON()
  -- remove \n
  vim.cmd([[%s/\\n//ge]])
  -- replace \" with "
  vim.cmd([[%s/\\"/"/ge]])
  -- remove quotes around brackets
  vim.cmd([[%s/"{/{/ge]])
  vim.cmd([[%s/}"/}/ge]])

  -- https://coderwall.com/p/faceag/format-json-in-vim
  vim.cmd("%!python3 -m json.tool | sed 's/    /  /g'")
end

vim.cmd("command! FormatJSON lua FormatJSON()")

-- Grep
if vim.fn.executable('rg') == 1 then
  vim.opt.grepprg = 'rg --vimgrep --no-heading --smart-case -g "!{mocks,CHANGELOG.md,CODEOWNERS,go.sum}"'
  vim.cmd([[
    command! -nargs=+ G execute 'silent grep! ' .. shellescape(escape(<q-args>, '*{[()\\'), 1) .. ' | copen 25'
  ]])
else
  vim.cmd('command -nargs=? G vimgrep /<args>/j **/* | copen 25')
end
vim.keymap.set('n', '|', ':G<Space>')

-- GitBlame function
-- https://stackoverflow.com/questions/33051496/custom-script-for-git-blame-from-vim
vim.cmd('command! -nargs=* GB call v:lua.GitBlame()')
function _G.GitBlame()
  local cmdline = "git blame -w " .. vim.fn.expand("%:p")
  local nline = vim.fn.line(".") + 1
  vim.cmd('botright new')
  vim.cmd('setlocal buftype=nofile bufhidden=wipe nobuflisted nowrap cursorline')
  vim.cmd('$read !' .. cmdline)
  vim.bo.modifiable = false
  vim.cmd('normal ' .. nline .. 'gg')
end
