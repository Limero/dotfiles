local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {'junegunn/fzf', event = "VeryLazy" },
  {'junegunn/fzf.vim', event = "VeryLazy" },
  {'lewis6991/gitsigns.nvim', event = "VeryLazy" },
  --{'wellle/context.vim', event = "VeryLazy" },
})

require('gitsigns').setup()
if vim.fn.executable('fzf') == 1 then
  require('fzf')
end
