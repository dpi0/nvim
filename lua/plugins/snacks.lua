return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    indent = {
      enabled = true,
      animate = {
        enabled = vim.fn.has 'nvim-0.10' == 1,
        style = 'out',
        easing = 'linear',
        duration = {
          step = 5,
          total = 200,
        },
      },
    },
    quickfile = {},
    image = {
      doc = {
        -- inline = false, -- Render image only on cursor url hover
      },
    },
    input = {},
    -- test with
    -- :lua vim.notify("Test notification from command line")
    notifier = {
      timeout = 3000, -- default timeout in ms
      width = { min = 60, max = 0.9 },
      height = { min = 1, max = 0.6 },
      -- editor margin to keep free. tabline and statusline are taken into account automatically
      margin = { top = 0, right = 1, bottom = 0 },
      padding = true, -- add 1 cell of left/right padding to the notification window
    },
    lazygit = {
      enabled = true,
      -- configure = false,
      theme = {
        selectedLineBgColor = { bg = 'CursorLine' },
        -- selectedLineBgColor = { bg = 'Default' },
        -- selectedLineBgColor = { bg = 'default' },
      },
      size = { width = 1, height = 1 },
    },
    styles = {
      lazygit = {
        width = 0,
        height = 0,
      },
    },
  },
  keys = {
    {
      -- '<A-u>',
      '<leader>z',
      function()
        require('snacks').lazygit { size = { width = 1, height = 1 } }
      end,
      mode = 'n',
      desc = 'Toggle Lazygit (normal)',
      silent = true,
      noremap = true,
    },
    {
      '<leader>lg',
      function()
        require('snacks').lazygit.log()
      end,
      desc = 'Lazygit Logs',
    },
    {
      '<leader>gl',
      function()
        require('snacks').picker.git_log {
          finder = 'git_log',
          format = 'git_log',
          preview = 'git_show',
          confirm = 'git_checkout',
          layout = 'vertical',
        }
      end,
      desc = 'Git Log',
    },
    {
      '<leader>gO',
      function()
        require('snacks').gitbrowse()
      end,
      desc = 'Open current file in the respective GitHub repo',
    },
    {
      '<leader>.',
      function()
        require('snacks').scratch()
      end,
      desc = 'Toggle Scratch Buffer',
    },
    {
      '<leader>>',
      function()
        require('snacks').scratch.select()
      end,
      desc = 'Select Scratch Buffer',
    },
    { '<leader>e', false },
    {
      '<leader>gb',
      function()
        require('snacks').picker.git_branches {
          layout = 'select',
        }
      end,
      desc = 'Branches',
    },
  },
}
