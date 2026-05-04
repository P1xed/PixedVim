local M = {}

function M.setup()
  local lsp_keymaps = function(bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = 'Go to definition' }))
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('force', opts, { desc = 'Find references' }))
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend('force', opts, { desc = 'Go to declaration' }))
    vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, vim.tbl_extend('force', opts, { desc = 'Go to implementation' }))
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('force', opts, { desc = 'Hover documentation' }))
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = 'Rename symbol' }))
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = 'Code action' }))
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, vim.tbl_extend('force', opts, { desc = 'Format buffer' }))
    vim.keymap.set('n', '<leader>di', vim.diagnostic.open_float, vim.tbl_extend('force', opts, { desc = 'Show diagnostics' }))
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, vim.tbl_extend('force', opts, { desc = 'Previous diagnostic' }))
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, vim.tbl_extend('force', opts, { desc = 'Next diagnostic' }))
  end

  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
      lsp_keymaps(args.data.client_id)
    end,
  })

  vim.lsp.config('*', {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
  })

  local servers = { 'lua_ls', 'pyright', 'ts_ls', 'gopls', 'rust_analyzer', 'clangd' }
  for _, server in ipairs(servers) do
    vim.lsp.enable(server)
  end
end

return M
