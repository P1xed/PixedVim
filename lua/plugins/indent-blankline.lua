local M = {}

function M.setup()
  if not pcall(require, 'ibl') then
    return
  end

  require('ibl').setup({})
end

return M