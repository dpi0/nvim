return {
  'dpi0/fim.nvim',
  opts = {
    launch_with_insert = true,
    height = 90,
    width = 90,
    position = 'center',
  },
  keys = {
    {
      '<A-i>',
      -- '<leader>j',
      function()
        require('fim').toggle()
      end,
      desc = 'Toggle floating terminal',
    },
    {
      '<Esc><Esc>',
      '<C-\\><C-n>',
      mode = 't',
      desc = "Exit terminal's insert mode",
    },
  },
}
