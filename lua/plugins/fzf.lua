local M = {}

function M.setup()
  if not pcall(require, 'fzf-lua') then
    return
  end

  require('fzf-lua').setup({
    winopts = {
      height = 0.5,
      width = 0.5,
      row = 0.5,
      col = 0.5,
      border = 'rounded',
    },
  })

  vim.keymap.set('n', '<leader><leader>', function()
    require('fzf-lua').files()
  end, { noremap = true, silent = true, desc = 'Find files (fzf)' })

  vim.keymap.set('n', '<leader>/', function()
    require('fzf-lua').live_grep()
  end, { noremap = true, silent = true, desc = 'Search text (rg + fzf)' })
end

return M
