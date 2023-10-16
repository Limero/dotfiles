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
  {
    'numToStr/Comment.nvim',
    opts = {
      toggler = {
        line = '<Leader>/',
      },
      opleader = {
        line = '<Leader>/',
      },
    },
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          "bash",
          "go",
          "json",
          "lua",
          "luadoc",
          "luap",
          "markdown",
          "markdown_inline",
          "vim",
          "vimdoc",
          "yaml",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<Leader>s",
            node_incremental = "<Leader>s",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
})

require('plugins.gitsigns')
require('plugins.fzf')
