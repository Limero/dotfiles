vim.cmd('colorscheme vim')

-- Set Pmenu background colors to avoid the default pink
vim.cmd('highlight Pmenu ctermbg=gray guibg=gray')

-- Set leader
vim.g.mapleader = ' '

-- Set netrw tree style to 3
vim.g.netrw_liststyle = 3

-- Set ttimeoutlen to 0 for fast escape key response
-- https://www.johnhawthorn.com/2012/09/vi-escape-delays/
vim.opt.ttimeoutlen = 0

-- Ignore case in wildmenu
vim.opt.wildignorecase = true

-- Ignore various file types and patterns in wildmenu
vim.opt.wildignore = {
  -- Files
  '*.o, *~, *.class, *.pyc, /*service, *.png, *.jpg, *.svg, *.pdf, *.graphml, *.eot, *.woff, *.log, *.sqlite, *.ttf, *.json, *.key, CHANGELOG.md, CODEOWNERS, go.sum, swagger.yaml',
  -- Directories
  '*/.git/*, */.hg/*, */.svn/*, */node_modules/*, */vendor/*, */cache/*, */bin/*, */.DS_Store, */gen/*, */mocks/*, */testdata/*'
}

-- Show line numbers and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set the terminal title
vim.opt.title = true

-- Disable highlighting of search results after search
vim.opt.hlsearch = false

-- Disable intro message
vim.opt.shortmess:append('I')

-- Use system clipboard for copy-paste
vim.opt.clipboard = 'unnamedplus'

-- Speed up preview while typing
vim.opt.updatetime = 300

-- Turn off backup and swap files
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Ignore case when searching, except when search string has capitalization
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Center cursor vertically
vim.opt.scrolloff = 999

-- Open new splits below and to the right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Disable status line
vim.opt.laststatus = 0

-- Set the path for project browsing using find
-- http://vim.wikia.com/wiki/Project_browsing_using_find
vim.opt.path = vim.fn.getcwd() .. '/**'

-- Set completion options
vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }

-- Set fold options
vim.opt.foldopen = { 'mark', 'quickfix', 'tag' }

-- Enable list mode with custom characters
vim.opt.list = true
vim.opt.listchars = {
  tab = '>-',
  nbsp = '%',
  trail = '·',
}

-- Expand tab to spaces
vim.opt.expandtab = true

-- Set shift width and tab stop to 2 spaces
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
