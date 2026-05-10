local M = {}

function M.setup()
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '

  vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true, desc = 'Toggle NeoTree' })

  vim.keymap.set('n', '<leader>t', function()
    require('toggleterm').toggle()
  end, { noremap = true, silent = true, desc = 'Toggle terminal' })

  vim.keymap.set('t', '<leader>t', function()
    require('toggleterm').toggle()
  end, { noremap = true, silent = true, desc = 'Toggle terminal' })

  vim.keymap.set('n', 'n', 'nzzzv', { noremap = true, silent = true, desc = 'Next search result' })
  vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true, silent = true, desc = 'Previous search result' })
  vim.keymap.set('n', 'J', 'mzJ`z', { noremap = true, silent = true, desc = 'Join lines' })

  vim.keymap.set('n', '<leader>;', ':bnext<CR>', { noremap = true, silent = true, desc = 'Next buffer' })
  vim.keymap.set('n', '<leader>,', ':bprevious<CR>', { noremap = true, silent = true, desc = 'Previous buffer' })
  vim.keymap.set('n', '<leader>bd', ':bd<CR>', { noremap = true, silent = true, desc = 'Delete buffer' })

  vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true, desc = 'Page down' })
  vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true, desc = 'Page up' })
end

return M