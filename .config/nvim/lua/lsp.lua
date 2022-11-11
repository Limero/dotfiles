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
                --line = string.gsub(vim.api.nvim_get_current_line(), '\t', '')
                --if vim.fn.pumvisible() and line:len() >= 1 and string.sub(line, -1) ~= ')' then
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-x><C-o>',true,false,true),'m',true)
                end
            end,
        })

        vim.api.nvim_create_autocmd("CompleteDone", {
            group = vim.api.nvim_create_augroup("Finished completion", {}),
            callback = function()
                vim.cmd.pclose()
            end,
        })

    end,
})
