local M = {}

function M.setup()
  if not pcall(require, 'neo-tree') then
    return
  end

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
end

return M