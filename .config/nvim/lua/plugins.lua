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
  {'stevearc/oil.nvim', event = "VeryLazy" },
  --{'wellle/context.vim', event = "VeryLazy" },
})

require('gitsig')
if vim.fn.executable('fzf') == 1 then
  require('fzf')
end

require("oil").setup({
  keymaps = {
    D = "dd"
  }
})
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
