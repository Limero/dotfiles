vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LSP actions", {}),
  callback = function(args)
    local function on_list(options)
      local items = options.items
      if #items > 1 then
        local filtered = {}
        for k, v in pairs(items) do
          if string.match(v.filename, 'mocks') == nil then
            table.insert(filtered, v)
          end
        end
        items = filtered
      end

      -- Store where we're jumping from before we jump.
      vim.cmd([[
      let tag = expand('<cword>')
      let pos = [bufnr()] + getcurpos()[1:]
      let item = {'bufnr': pos[0], 'from': pos, 'tagname': tag}
      let winid = win_getid()
      let stack = gettagstack(winid)
      let stack['items'] = [item]
      call settagstack(winid, stack, 't')
      ]])

      vim.fn.setqflist({}, ' ', { title = options.title, items = items, context = options.context })
      if #items == 1 then
        vim.cmd('silent! cfirst')
      else
        vim.cmd('copen')
      end
    end

    vim.keymap.set("n", "<C-\\>", function() vim.lsp.buf.implementation { on_list = on_list } end, { buffer = args.buf })
    vim.keymap.set('n', 'ge', vim.diagnostic.setqflist, { buffer = args.buf })

    -- will be defaults in 0.11
    vim.keymap.set('n', 'gra', vim.lsp.buf.code_action, { buffer = args.buf })
    vim.keymap.set('n', 'grn', vim.lsp.buf.rename, { buffer = args.buf })
    vim.keymap.set('n', 'grr', function()
      vim.cmd('cclose')
      vim.lsp.buf.references({ includeDeclaration = false })
    end, { buffer = args.buf })

    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format on save", {}),
      callback = function()
        local client = vim.lsp.get_clients()[1]
        if not client or not client.server_capabilities then return end

        vim.lsp.buf.format({ bufnr = bufnr })

        -- Organizing imports in lua messes up the file
        if vim.bo.filetype == "lua" then return end

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
        local client = vim.lsp.get_clients()[1]
        if not client or not client.server_capabilities then return end

        local col = vim.api.nvim_win_get_cursor(0)[2]
        local char = vim.api.nvim_get_current_line():sub(col, col)
        --if vim.fn.pumvisible() and not char:match("[\t :;=){}-]") then
        if vim.fn.pumvisible() and char:match("[a-zA-Z.]") then
          vim.api.nvim_feedkeys(vim.keycode('<C-x><C-o>'), 'm', true)
        end
      end,
    })
  end,
})

function LoadingMessage(client)
  vim.notify("Loading " .. client.name .. "...", vim.log.levels.WARN)
  vim.api.nvim_create_autocmd("DiagnosticChanged",
    { pattern = "*", callback = function() vim.notify("") end, once = true })
end

function RestartLSP()
  vim.lsp.stop_client(vim.lsp.get_clients())
  vim.defer_fn(function()
    vim.cmd('e')
    print('Restarted LSP')
  end, 500)
end

vim.cmd("command! RestartLSP lua RestartLSP()")
