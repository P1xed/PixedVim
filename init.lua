vim.loader.enable()

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.spec.name == 'nvim-treesitter' and ev.data.kind == 'update' then
      vim.cmd('TSUpdate')
    end
  end,
})

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
}, { load = true, confirm = false })

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Setup mini.icons as nvim-web-devicons replacement
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

-- Setup neo-tree
require('neo-tree').setup({
  sources = { 'filesystem', 'buffers', 'git_status' },
  source_selector = {
    winbar = false,
    statusline = false,
  },
  close_if_last_window = true,
  popup_border_style = 'rounded',
  enable_git_status = true,
  enable_diagnostics = true,
  default_component_configs = {
    indent = {
      with_expanders = true,
      expander_collapsed = '▸ ',
      expander_expanded = '▾ ',
      expander_highlight = 'NeoTreeExpander',
    },
    git_status = {
      symbols = {
        added = '+',
        conflict = '!',
        deleted = '✘',
        ignored = '◌',
        modified = '~',
        renamed = '»',
        staged = '[A]',
        untracked = '?',
      },
    },
  },
  window = {
    position = 'left',
    width = 40,
    mappings = {
      ['<space>'] = 'none',
    },
  },
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = true,
      hide_hidden = true,
    },
    follow_current_file = {
      enabled = true,
      leave_dirs_open = false,
    },
    hijack_netrw_behavior = 'open_default',
    use_libuv_file_watcher = true,
  },
})

vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true, desc = 'Toggle NeoTree' })

-- Toggle terminal
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

vim.keymap.set('n', '<leader>t', function()
  require('toggleterm').toggle()
end, { noremap = true, silent = true, desc = 'Toggle terminal' })

vim.keymap.set('t', '<leader>t', function()
  require('toggleterm').toggle()
end, { noremap = true, silent = true, desc = 'Toggle terminal' })

-- LSP configuration
local lsp_keymaps = function(bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = 'Go to definition' }))
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('force', opts, { desc = 'Find references' }))
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend('force', opts, { desc = 'Go to declaration' }))
  vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, vim.tbl_extend('force', opts, { desc = 'Go to implementation' }))
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('force', opts, { desc = 'Hover documentation' }))
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = 'Rename symbol' }))
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = 'Code action' }))
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, vim.tbl_extend('force', opts, { desc = 'Format buffer' }))
  vim.keymap.set('n', '<leader>di', vim.diagnostic.open_float, vim.tbl_extend('force', opts, { desc = 'Show diagnostics' }))
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, vim.tbl_extend('force', opts, { desc = 'Previous diagnostic' }))
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, vim.tbl_extend('force', opts, { desc = 'Next diagnostic' }))
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    lsp_keymaps(args.data.client_id)
  end,
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.lsp.config('*', {
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})

-- Enable common language servers
local servers = { 'lua_ls', 'pyright', 'ts_ls', 'gopls', 'rust_analyzer', 'clangd' }
for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end

-- Install all available parsers
require('nvim-treesitter').install('all')

vim.o.foldenable = false
vim.o.foldlevel = 99

-- Enable treesitter features for all filetypes
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

-- Text objects
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
