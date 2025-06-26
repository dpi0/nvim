return {
  'mg979/vim-visual-multi',
  event = 'VeryLazy',
  init = function()
    vim.g.VM_maps = {
      ['Find Under'] = '<A-n>',
      ['Find Subword Under'] = '<A-n>',
      ['Select All'] = '<A-S-n>',
      ['Add Cursor Down'] = '<A-S-j>',
      ['Add Cursor Up'] = '<A-S-k>',
    }
    vim.g.VM_show_warnings = 0
    vim.g.VM_silent_exit = 1
  end,
}
