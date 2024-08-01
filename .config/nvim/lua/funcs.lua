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
function _G.grep_and_open(args)
  vim.opt.grepprg = 'rg --vimgrep --no-heading --smart-case -g "!{mocks,CHANGELOG.md,CODEOWNERS,go.sum}"'
  local grep_args = vim.fn.shellescape(vim.fn.escape(args, '*{[()\\'), 1)

  vim.cmd(string.format('silent grep! %s | copen 25', grep_args))

  if vim.fn.empty(vim.fn.getqflist()) == 1 then
    vim.cmd('cclose')
    print('No results found')
  end
end

vim.cmd([[command! -nargs=+ G lua _G.grep_and_open(<q-args>)]])

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
