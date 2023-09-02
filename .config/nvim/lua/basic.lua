-- Enable filetype detection, plugins, and indentation
vim.cmd('filetype plugin indent on')

-- Enable syntax highlighting
vim.cmd('syntax enable')

-- Set Pmenu background colors to avoid the default pink
vim.cmd('highlight Pmenu ctermbg=gray guibg=gray')

-- Set netrw tree style to 3
vim.g.netrw_liststyle = 3

-- Set ttimeoutlen to 0 for fast escape key response
-- https://www.johnhawthorn.com/2012/09/vi-escape-delays/
vim.opt.ttimeoutlen = 0

-- Enable wildmenu for command-line completion
vim.opt.wildmenu = true

-- Ignore case in wildmenu
vim.opt.wildignorecase = true

-- Ignore various file types and patterns in wildmenu
vim.opt.wildignore:append(
  '*.o, *~, *.class, *.pyc, /*service, *.png, *.jpg, *.svg, *.pdf, *.graphml, *.eot, *.woff, *.log, *.sqlite, *.ttf, *.json, *.key, CHANGELOG.md, CODEOWNERS, go.sum, swagger.yaml')

-- Ignore directories in wildmenu
vim.opt.wildignore:append(
  '*/.git/*, */.hg/*, */.svn/*, */node_modules/*, */vendor/*, */cache/*, */bin/*, */.DS_Store, */gen/*, */mocks/*, */testdata/*')

-- Enable auto-indentation
vim.opt.autoindent = true

-- Show line numbers and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Disable all beep and bell sounds
vim.opt.belloff:append('all')

-- Enable mouse support
vim.opt.mouse = 'a'

-- Show the command being typed
vim.opt.showcmd = true

-- Set character encoding to UTF-8
vim.opt.encoding = 'utf-8'

-- Set the terminal title
vim.opt.title = true

-- Disable highlighting of search results after search
vim.opt.hlsearch = false

-- Enable hidden buffers (Switch buffers without saving)
vim.opt.hidden = true

-- Disable intro message
vim.opt.shortmess:append('I')

-- Use system clipboard for copy-paste
vim.opt.clipboard = 'unnamedplus'

-- Speed up preview while typing
vim.opt.updatetime = 300

-- Show the cursor position all the time
vim.opt.ruler = true

-- Turn off backup and swap files
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Remove octal numbers for Ctrl-A and Ctrl-X
vim.opt.nrformats:remove('octal')

-- Ignore case when searching, except when search string has capitalization
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Jump to search results while typing
vim.opt.incsearch = true

-- Center cursor vertically
vim.opt.scrolloff = 999

-- Open new splits below and to the right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Disable status line
vim.opt.laststatus = 0

-- Set the path for project browsing using find
-- http://vim.wikia.com/wiki/Project_browsing_using_find
vim.opt.path:append('$PWD/**')

-- Set completion options
vim.opt.completeopt:append('menuone')
vim.opt.completeopt:append('noselect')
vim.opt.completeopt:append('noinsert')

-- Set fold options
vim.opt.foldopen:append('mark')
vim.opt.foldopen:append('quickfix')
vim.opt.foldopen:append('tag')

-- Enable list mode with custom characters
vim.opt.list = true
vim.opt.listchars = {
  tab = '>-',
  nbsp = '%',
  trail = '·',
}

-- Use smart tab and expand tab to spaces
vim.opt.smarttab = true
vim.opt.expandtab = true

-- Set shift width and tab stop to 2 spaces
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
