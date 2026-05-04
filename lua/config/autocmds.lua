local M = {}

function M.setup()
  vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
      if ev.data.spec.name == 'nvim-treesitter' and ev.data.kind == 'update' then
        vim.cmd('TSUpdate')
      end
    end,
  })
end

return M
