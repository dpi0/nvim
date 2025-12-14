return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  ft = { 'dart' },
  -- event = 'BufRead *.dart',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- 'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = true,
  keys = {
    { '<leader>flr', '<cmd>FlutterRun<cr>', desc = 'Flutter: Run', mode = 'n' },
    { '<leader>flo', '<cmd>FlutterOutlineToggle<cr>', desc = 'Flutter: Outline Window - Toggle', mode = 'n' },
    { '<leader>fllc', '<cmd>FlutterLogClear<cr>', desc = 'Flutter: Logs - Clear', mode = 'n' },
    { '<leader>fllt', '<cmd>FlutterLogToggle<cr>', desc = 'Flutter: Logs - Toggle', mode = 'n' },
    { '<leader>flR', '<cmd>FlutterRestart<cr>', desc = 'Flutter: Restart', mode = 'n' },
    { '<leader>fld', '<cmd>FlutterDevices<cr>', desc = 'Flutter: Devices - Choose,', mode = 'n' },
  },
}
