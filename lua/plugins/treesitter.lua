local M = {}

function M.setup()
  if not pcall(require, 'nvim-treesitter.configs') then
    return
  end

  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'python', 'javascript', 'typescript', 'go', 'rust', 'c', 'cpp' },
    highlight = { enable = true },
    indent = { enable = true },
  })

  if pcall(require, 'nvim-treesitter-textobjects') then
    require('nvim-treesitter-textobjects').setup({
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
    })
  end

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
end

return M
