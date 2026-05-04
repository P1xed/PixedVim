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
end

return M
