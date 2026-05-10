local M = {}

function M.setup()
  vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
      if ev.data.spec.name == 'nvim-treesitter' and ev.data.kind == 'update' then
        vim.cmd('TSUpdate')
      end
    end,
  })

  vim.api.nvim_create_autocmd('FileType', {
    callback = function()
      local ft = vim.bo.filetype
      if ft == 'neo-tree' or ft == 'neo-tree-popup' or ft == 'toggleterm' then
        return
      end
      vim.treesitter.start()
      vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo[0][0].foldmethod = 'expr'
      vim.bo[0].indentexpr = 'v:lua.vim.treesitter.indentexpr()'
    end,
  })

  vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
      vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })
    end,
  })

  vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
      vim.cmd('Neotree toggle')
    end,
  })
end

return M