vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt.listchars = 'tab:  ,nbsp:%,trail:·'
vim.opt.expandtab = false

local path = vim.fs.find({ "go.mod" }, { type = "file" })
vim.lsp.start({
    name = "gopls",
    cmd = { "gopls", "serve" },
    root_dir = vim.fs.dirname(path[1]),
    settings = {
        ["gopls"] = {
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
})
