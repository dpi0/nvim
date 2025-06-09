return {
  'mg979/vim-visual-multi',
  event = 'VeryLazy',
  init = function()
    vim.g.VM_maps = {
      ['Find Under'] = '<C-m>',
      ['Find Subword Under'] = '<C-m>',
      ['Select All'] = '<C-b>',
      ['Add Cursor Down'] = '<A-S-j>',
      ['Add Cursor Up'] = '<A-S-k>',
    }
    vim.g.VM_show_warnings = 0
    vim.g.VM_silent_exit = 1
  end,
}
