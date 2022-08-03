local cmp = require'cmp'

cmp.setup({
  window = {
    --completion = cmp.config.window.bordered(),
    --documentation = cmp.config.window.bordered(),
    documentation = cmp.config.disable
  },
  mapping = cmp.mapping.preset.insert({}),
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = entry.completion_item.detail
      return vim_item
    end
  },
  preselect = cmp.PreselectMode.None,
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'nvim_lsp_signature_help' }
  }, {
    { name = 'buffer' },
  })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
