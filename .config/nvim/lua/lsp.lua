vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        vim.keymap.set("n", "<C-\\>", vim.lsp.buf.implementation, { buffer = args.buf })
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { buffer = args.buf })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = args.buf })
    end,
})
