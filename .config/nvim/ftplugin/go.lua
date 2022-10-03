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
