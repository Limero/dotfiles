require('gitsigns').setup {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map('n', 'gn', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    map('n', 'gp', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    map('n', 'grh', gs.reset_hunk)
    map('n', 'gsh', gs.stage_hunk)
    map('n', 'gb', gs.blame)

    if vim.fn.exists(':GitFiles') ~= 0 then
      vim.cmd('delcommand GitFiles')
    end
  end
}
