local path = vim.fs.find({ "Cargo.toml" }, { type = "file" })
vim.lsp.start({
    name = "rust-analyzer",
    cmd = { "rust-analyzer" },
    root_dir = vim.fs.dirname(path[1]),
    settings = {
        ["rust-analyzer"] = {
            cargo = { allFeatures = true },
        },
    },
})
