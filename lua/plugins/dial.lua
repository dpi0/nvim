return {
  'monaqa/dial.nvim',
  config = function()
    local augend = require 'dial.augend'
    require('dial.config').augends:register_group {
      -- default augends used when no group name is specified
      default = {
        augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
        augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
        augend.date.alias['%Y/%m/%d'], -- date (2022/02/19, etc.)
        augend.constant.alias.bool, -- boolean value (true <-> false)
        -- CUSTOM ONES
        augend.constant.new {
          elements = { 'true', 'false' },
          word = true,
          cyclic = true,
        },
        augend.constant.new {
          elements = { 'TRUE', 'FALSE' },
          word = true,
          cyclic = true,
        },
        augend.constant.new {
          elements = { 'yes', 'no' },
          word = true,
          cyclic = true,
        },
        augend.constant.new {
          elements = { 'YES', 'NO' },
          word = true,
          cyclic = true,
        },
        augend.constant.new {
          elements = { 'on', 'off' },
          word = true,
          cyclic = true,
        },
        augend.constant.new {
          elements = { 'ON', 'OFF' },
          word = true,
          cyclic = true,
        },
        augend.constant.new {
          elements = { 'enabled', 'disabled' },
          word = true,
          cyclic = true,
        },
        augend.constant.new {
          elements = { 'ENABLED', 'DISABLED' },
          word = true,
          cyclic = true,
        },
        augend.constant.new {
          elements = { 'left', 'right', 'up', 'down' },
          word = true,
          cyclic = true,
        },
        augend.constant.new {
          elements = { 'always', 'unless-stoppped' }, -- for docker, restart: xyz
          word = true,
          cyclic = true,
        },
      },

      -- -- Visual mode group
      -- visual = {
      --   augend.integer.alias.decimal,
      --   augend.constant.new { elements = { 'restart', 'unless-stoppped' }, word = true, cyclic = true },
      -- },
    }
  end,
  keys = {
    -- Normal mode
    {
      '<C-a>',
      function()
        require('dial.map').manipulate('increment', 'normal')
      end,
      mode = 'n',
    },
    {
      '<C-x>',
      function()
        require('dial.map').manipulate('decrement', 'normal')
      end,
      mode = 'n',
    },
    {
      'g<C-a>',
      function()
        require('dial.map').manipulate('increment', 'gnormal')
      end,
      mode = 'n',
    },
    {
      'g<C-x>',
      function()
        require('dial.map').manipulate('decrement', 'gnormal')
      end,
      mode = 'n',
    },

    -- Visual mode
    {
      '<C-a>',
      function()
        require('dial.map').manipulate('increment', 'visual')
      end,
      mode = 'v',
    },
    {
      '<C-x>',
      function()
        require('dial.map').manipulate('decrement', 'visual')
      end,
      mode = 'v',
    },
    {
      'g<C-a>',
      function()
        require('dial.map').manipulate('increment', 'gvisual')
      end,
      mode = 'v',
    },
    {
      'g<C-x>',
      function()
        require('dial.map').manipulate('decrement', 'gvisual')
      end,
      mode = 'v',
    },
  },
}
