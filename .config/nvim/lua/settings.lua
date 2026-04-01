vim.cmd('colorscheme vim')
--vim.cmd('highlight Pmenu ctermbg=gray guibg=gray') -- avoid the default pink
vim.api.nvim_set_hl(0, 'Pmenu', { ctermbg = 'gray', ctermfg = 'black' }) -- avoid the default pink
vim.opt.termguicolors = false

vim.schedule(function() vim.opt.clipboard = 'unnamedplus' end) -- System clipboard for copy-paste (scheduled because it can increase startup-time)

-- Ignore case when searching, except when search string has capitalization
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.list = true
vim.opt.listchars = { tab = '>-', nbsp = '%', trail = '·' }
vim.opt.ttimeoutlen = 0 -- for fast escape key response - https://www.johnhawthorn.com/2012/09/vi-escape-delays/
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.title = true          -- Set the terminal title
vim.opt.shortmess:append('I') -- Disable intro message
vim.opt.breakindent = true
vim.opt.updatetime = 250      -- Speed up preview while typing
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.scrolloff = 999                          -- Center cursor vertically
vim.opt.splitbelow = true                        -- Open new horizontal splits below
vim.opt.splitright = true                        -- Open new vertical splits to the right
vim.opt.laststatus = 0                           -- Disable status line
vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
vim.opt.foldopen = { 'mark', 'quickfix', 'tag' } -- fold options
vim.opt.expandtab = true                         -- Expand tab to spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0                           -- will use tabstop value if 0
