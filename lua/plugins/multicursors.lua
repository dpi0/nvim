return {
  'mg979/vim-visual-multi',
  event = 'VeryLazy',
  init = function()
    vim.g.VM_maps = {
      ['Find Under'] = '<A-m>',
      ['Find Subword Under'] = '<A-m>',
      ['Select All'] = '<A-S-m>',
      ['Add Cursor Down'] = '<A-S-j>',
      ['Add Cursor Up'] = '<A-S-k>',
    }
    vim.g.VM_show_warnings = 0
    vim.g.VM_silent_exit = 1
  end,
}
