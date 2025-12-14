return {
  'charm-and-friends/freeze.nvim',
  opts = {
    command = 'freeze',
    open = true,
    font = {
      family = 'JetBrains Mono Nerd Font',
      size = 16,
    },
    padding = '20',
    theme = 'catppuccin-macchiato', -- https://xyproto.github.io/splash/docs/all.html
    line_height = 1.4,
    show_line_numbers = true,
    window = true,
    output = function()
      local home = os.getenv 'HOME'
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':t'):gsub('%s+', '_')
      return string.format('%s/Screenshots/%s_(%s)_(%s).png', home, filename, os.date '%H-%M-%S', os.date '%d-%b')
    end,
  },
  keys = {
    {
      '<leader>u',
      ':Freeze<cr>', -- WARNING: <CMD> doesn't work fsr https://github.com/charm-and-friends/freeze.nvim/issues/11#issuecomment-2802157364
      desc = 'Freeze',
      mode = { 'n', 'v' },
      silent = true,
    },
  },
}
