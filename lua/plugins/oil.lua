return {
  'stevearc/oil.nvim',
  lazy = false,
  dependencies = { 'nvim-mini/mini.icons', opts = {} },
  opts = {
    default_file_explorer = true,
    watch_for_changes = true,
    columns = {
      'icon',
      -- 'permissions',
      'size',
      'mtime',
    },
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
      natural_order = true,
      is_always_hidden = function(name, _)
        return name == '..' or name == '.git'
      end,
    },
    float = {
      padding = 2,
      max_width = 90,
      max_height = 0,
    },
    win_options = {
      wrap = true,
      winblend = 0,
    },
    preview_win = {
      width = 0.9,
    },
    use_default_keymaps = true,
    keymaps = {
      ['<C-c>'] = false,
      ['<C-s>'] = false,
      ['<C-h>'] = false,
      ['<C-l>'] = false,
      ['<C-t>'] = false,
      ['<A-S-j>'] = false,
      ['<A-S-k>'] = false,
      ['q'] = 'actions.close',
      ['<S-l>'] = 'actions.select',
      ['<S-h>'] = { 'actions.parent', mode = 'n' },
      ['g?'] = { 'actions.show_help', mode = 'n' },
      ['<C-p>'] = 'actions.preview',
      ['<C-r>'] = 'actions.refresh',
      ['-'] = { 'actions.parent', mode = 'n' },
      ['_'] = { 'actions.open_cwd', mode = 'n' },
      ['`'] = { 'actions.cd', mode = 'n' },
      ['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
      ['gs'] = { 'actions.change_sort', mode = 'n' },
      ['gx'] = 'actions.open_external',
      ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
      ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
      ['<S-k>'] = { 'actions.preview_scroll_up', mode = 'n' },
      ['<S-j>'] = { 'actions.preview_scroll_down', mode = 'n' },
    },
  },
  -- config = function()
  --   require('oil').setup {
  --   }
  -- end,
}
