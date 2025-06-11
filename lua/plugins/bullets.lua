return {
  'bullets-vim/bullets.vim',
  ft = { 'markdown', 'text', 'gitcommit', 'scratch' },
  init = function()
    vim.g.bullets_enabled_file_types = {
      'markdown',
      'text',
      'gitcommit',
      'scratch',
    }
  end,
}
