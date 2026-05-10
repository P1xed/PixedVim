vim.loader.enable()

vim.opt.runtimepath:append(vim.fn.stdpath('config'))

package.path = vim.fn.stdpath('config') .. '/?.lua;' .. package.path

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('config.options')
require('config.diagnostics')
require('config.keymaps').setup()
require('config.autocmds').setup()

vim.pack.add({
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    name = 'nvim-treesitter',
  },
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
    name = 'nvim-treesitter-textobjects',
  },
  {
    src = 'https://github.com/MunifTanjim/nui.nvim',
    name = 'nui.nvim',
  },
  {
    src = 'https://github.com/nvim-lua/plenary.nvim',
    name = 'plenary.nvim',
  },
  {
    src = 'https://github.com/echasnovski/mini.icons',
    name = 'mini.icons',
  },
  {
    src = 'https://github.com/echasnovski/mini.pairs',
    name = 'mini.pairs',
  },
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    name = 'neo-tree.nvim',
  },
  {
    src = 'https://github.com/akinsho/toggleterm.nvim',
    name = 'toggleterm.nvim',
  },
  {
    src = 'https://github.com/neovim/nvim-lspconfig',
    name = 'nvim-lspconfig',
  },
  {
    src = 'https://github.com/lukas-reineke/indent-blankline.nvim',
    name = 'indent-blankline',
  },
}, { load = true, confirm = false })

require('plugins.mini').setup()
require('plugins.neo-tree').setup()
require('plugins.toggleterm').setup()
require('plugins.lsp').setup()
require('plugins.indent-blankline').setup()