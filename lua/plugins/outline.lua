return {
  'hedyhli/outline.nvim',
  lazy = true,
  cmd = { 'Outline', 'OutlineOpen' },
  keys = {
    { '<leader>O', '<cmd>Outline<CR>', desc = 'Toggle outline' },
  },
  -- https://github.com/hedyhli/outline.nvim?tab=readme-ov-file#default-options
  opts = { width = 20, show_cursorline = false },
}
