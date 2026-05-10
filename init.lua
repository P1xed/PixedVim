vim.loader.enable()

vim.opt.runtimepath:append(vim.fn.stdpath('config'))

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('lua.config.options')
require('lua.config.diagnostics')
require('lua.config.keymaps').setup()
require('lua.config.autocmds').setup()

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

require('lua.plugins.mini').setup()
require('lua.plugins.neo-tree').setup()
require('lua.plugins.toggleterm').setup()
require('lua.plugins.lsp').setup()
require('lua.plugins.indent-blankline').setup()