vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LSP actions", {}),
    callback = function(args)
        vim.keymap.set("n", "<C-\\>", vim.lsp.buf.implementation, { buffer = args.buf })
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { buffer = args.buf })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = args.buf })

        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format on save", {}),
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })

                -- https://github.com/neovim/nvim-lspconfig/issues/115
                local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding())
                params.context = { only = { "source.organizeImports" } }
                local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 5000)
                for _, res in pairs(result or {}) do
                  for _, r in pairs(res.result or {}) do
                    if r.edit then
                      vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding())
                    else
                      vim.lsp.buf.execute_command(r.command)
                    end
                  end
                end

            end,
        })

        vim.api.nvim_create_autocmd("TextChangedI", {
            group = vim.api.nvim_create_augroup("Completion while typing", {}),
            callback = function()
                local col = vim.api.nvim_win_get_cursor(0)[2]
                local char = vim.api.nvim_get_current_line():sub(col,col)
                if vim.fn.pumvisible() and
                    char ~= '\t' and
                    char ~= ' ' and
                    char ~= ':' and
                    char ~= ';' and
                    char ~= '=' and
                    char ~= ')' and
                    char ~= '{' and
                    char ~= '}' then
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-x><C-o>',true,false,true),'m',true)
                end
            end,
        })

    end,
})
