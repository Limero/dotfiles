vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt.listchars = 'tab:  ,nbsp:%,trail:·'
vim.opt.expandtab = false

vim.cmd(':nmap yt :let @+ = "go test -run ^" .. expand("<cword>") .. "$ " .. expand("%:p:h")<cr>')

local path = vim.fs.find({ "go.mod" }, { type = "file" })
vim.lsp.start({
    name = "gopls",
    cmd = { "gopls", "serve" },
    root_dir = vim.fs.dirname(path[1]),
    settings = {
        ["gopls"] = {
            analyses = {
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                shadow = true,
            },
            gofumpt = true,
            staticcheck = true,
        },
    },
})
