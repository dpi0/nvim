return {
  'mikavilpas/yazi.nvim',
  -- dependencies = {
  --   'folke/snacks.nvim',
  -- },
  event = 'VeryLazy',
  opts = {
    floating_window_scaling_factor = 1.0,
  },
  keys = {
    {
      '<leader>e',
      mode = { 'n', 'v' },
      '<cmd>Yazi<cr>',
      desc = 'Open yazi at the current file',
    },
    {
      '<leader>E',
      '<cmd>Yazi toggle<cr>',
      desc = 'Resume the last yazi session',
    },
    {
      '<leader>cw',
      '<cmd>Yazi cwd<cr>',
      desc = "Open the file manager in nvim's working directory",
    },
    opts = {
      keymaps = {
        show_help = '<f1>',
      },
    },
  },
}
