vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LSP actions", {}),
    callback = function(args)
        vim.keymap.set("n", "<C-\\>", vim.lsp.buf.implementation, { buffer = args.buf })
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { buffer = args.buf })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = args.buf })

        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format on save", {}),
            callback = function()
                vim.lsp.buf.code_action({
                    bufnr = bufnr,
                    context = {
                        only = { "source.organizeImports" }
                    },
                    apply = true,
                })
                vim.lsp.buf.format({ bufnr = bufnr })
            end,
        })
    end,
})
