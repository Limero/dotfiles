vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('LSP actions', {}),
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

    local function on_list(options)
      local items = options.items
      if #items > 1 then
        local filtered = {}
        for _, v in pairs(items) do
          if string.match(v.filename, 'mocks') == nil then
            table.insert(filtered, v)
          end
        end
        items = filtered
      end

      vim.fn.setqflist({}, ' ', { title = options.title, items = items, context = options.context })
      if #items == 1 then
        vim.cmd('silent! cfirst')
      else
        vim.cmd('copen')
      end
    end

    vim.diagnostic.config({ virtual_text = true })

    vim.keymap.set('n', '<C-\\>', function() vim.lsp.buf.implementation { on_list = on_list } end, { buffer = ev.buf })
    vim.keymap.set('n', 'ge', vim.diagnostic.setqflist, { buffer = ev.buf })

    vim.keymap.set('n', 'grr', function()
      vim.cmd('cclose')
      vim.lsp.buf.references({ includeDeclaration = false })
    end, { buffer = ev.buf })

    vim.api.nvim_create_autocmd('BufWritePre', {
      group = vim.api.nvim_create_augroup('Format on save', {}),
      callback = function()
        if not client.server_capabilities then return end

        vim.lsp.buf.format()

        -- Organizing imports in lua messes up the file
        if vim.bo.filetype == 'lua' then return end

        -- https://github.com/neovim/nvim-lspconfig/issues/115
        local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding())
        params.context = { only = { 'source.organizeImports' } }
        local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params, 5000)
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

    if client:supports_method('textDocument/completion') then
      client.server_capabilities.completionProvider.triggerCharacters = vim.split(
        'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM.', '')
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

function LoadingMessage(client)
  vim.notify('Loading ' .. client.name .. '...', vim.log.levels.WARN)
  vim.api.nvim_create_autocmd('DiagnosticChanged',
    { pattern = '*', callback = function() vim.notify('') end, once = true })
end

vim.lsp.config('*', {
  on_init = LoadingMessage,
})

vim.lsp.enable({
  'clangd',
  'gopls',
  'lua_ls',
  'ols',
  'rust_analyzer',
})
