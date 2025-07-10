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
    -- terminal = { enabled = true },
    picker = {
      enabled = false,
      -- In case you want to make sure that the score manipulation above works
      -- or if you want to check the score of each file
      debug = {
        scores = false, -- show scores in the list
      },
      -- I like the "ivy" layout, so I set it as the default globaly, you can
      -- still override it in different keymaps
      layout = {
        preset = 'default',
        -- When reaching the bottom of the results in the picker, I don't want
        -- it to cycle and go back to the top
        cycle = true,
      },
      layouts = {
        -- I wanted to modify the layout width
        --
        vertical = {
          layout = {
            backdrop = false,
            width = 0.8,
            min_width = 80,
            height = 0.8,
            min_height = 30,
            box = 'vertical',
            border = 'rounded',
            title = '{title} {live} {flags}',
            title_pos = 'center',
            { win = 'input', height = 1, border = 'bottom' },
            { win = 'list', border = 'none' },
            { win = 'preview', title = '{preview}', height = 0.4, border = 'top' },
          },
        },
      },
      matcher = {
        frecency = true,
      },
      win = {
        input = {
          keys = {
            -- to close the picker on ESC instead of going to normal mode,
            -- add the following keymap to your config
            ['<Esc>'] = { 'close', mode = { 'n', 'i' } },
            ['q'] = { 'hide', mode = { 'n', 'i' } },
            -- I'm used to scrolling like this in LazyGit
            ['J'] = { 'preview_scroll_down', mode = { 'i', 'n' } },
            ['K'] = { 'preview_scroll_up', mode = { 'i', 'n' } },
            ['H'] = { 'preview_scroll_left', mode = { 'i', 'n' } },
            ['L'] = { 'preview_scroll_right', mode = { 'i', 'n' } },
          },
        },
      },
      formatters = {
        file = {
          -- filename_first = true, -- display filename before the file path
          truncate = 80,
        },
      },
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
