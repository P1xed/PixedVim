local M = {}

function M.setup()
  vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true, desc = 'Toggle NeoTree' })

  vim.keymap.set('n', '<leader>t', function()
    require('toggleterm').toggle()
  end, { noremap = true, silent = true, desc = 'Toggle terminal' })

  vim.keymap.set('t', '<leader>t', function()
    require('toggleterm').toggle()
  end, { noremap = true, silent = true, desc = 'Toggle terminal' })
end

return M
