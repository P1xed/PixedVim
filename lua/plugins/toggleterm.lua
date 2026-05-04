local M = {}

function M.setup()
  if not pcall(require, 'toggleterm') then
    return
  end

  require('toggleterm').setup({
    size = function()
      return math.floor(vim.o.lines / 4)
    end,
    open_mapping = nil,
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = 'float',
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = 'rounded',
      width = function()
        return math.floor(vim.o.columns / 2)
      end,
      height = function()
        return math.floor(vim.o.lines / 2)
      end,
      winblend = 3,
    },
  })
end

return M
