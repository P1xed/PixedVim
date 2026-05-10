local M = {}

function M.setup()
  if pcall(require, 'mini.icons') then
    require('mini.icons').setup()
    package.loaded['nvim-web-devicons'] = {
      get_icon = function(name)
        local icon, hl = require('mini.icons').get('file', name or '')
        return icon or '', hl or ''
      end,
      get_icon_name = function() return true end,
      has_loaded = function() return true end,
      setup = function() end,
    }
  end

  if pcall(require, 'mini.pairs') then
    require('mini.pairs').setup()
  end

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
end

return M