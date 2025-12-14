return {
  'Bekaboo/dropbar.nvim',
  event = 'BufEnter',
  keys = {
    {
      '<Leader>w',
      function()
        require('dropbar.api').pick()
      end,
      desc = 'Pick symbols in winbar',
      mode = 'n',
    },
    {
      '<Leader>ip',
      function()
        require('dropbar.api').goto_context_start()
      end,
      desc = 'Go to start of current context',
      mode = 'n',
    },
    {
      '<Leader>in',
      function()
        require('dropbar.api').select_next_context()
      end,
      desc = 'Select next context',
      mode = 'n',
    },
  },
}
