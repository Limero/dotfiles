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
  { 'junegunn/fzf.vim',        event = "VeryLazy" },
  { 'lewis6991/gitsigns.nvim', event = "VeryLazy" },
  { 'github/copilot.vim' },
})

vim.g.copilot_filetypes = {
  ['*'] = false,
  ['go'] = true,
}

require('plugins.gitsigns')
require('plugins.fzf')
