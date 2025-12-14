return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      '<leader>fa',
      function()
        require('harpoon'):list():add()
      end,
      desc = 'Harpoon: Add file',
    },
    {
      '<leader>j',
      function()
        local harpoon = require 'harpoon'
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = 'Harpoon: Toggle quick menu',
    },
    {
      '<A-1>',
      function()
        require('harpoon'):list():select(1)
      end,
      desc = 'Harpoon: Go to file 1',
    },
    {
      '<A-2>',
      function()
        require('harpoon'):list():select(2)
      end,
      desc = 'Harpoon: Go to file 2',
    },
    {
      '<A-3>',
      function()
        require('harpoon'):list():select(3)
      end,
      desc = 'Harpoon: Go to file 3',
    },
    {
      '<A-4>',
      function()
        require('harpoon'):list():select(4)
      end,
      desc = 'Harpoon: Go to file 4',
    },
    {
      '<A-0>',
      function()
        require('harpoon'):list():select(5)
      end,
      desc = 'Harpoon: Go to file 5',
    },
    {
      '<A-9>',
      function()
        require('harpoon'):list():select(6)
      end,
      desc = 'Harpoon: Go to file 6',
    },
    -- Toggle previous & next buffers stored within Harpoon list
    {
      '<A-S-H>',
      function()
        require('harpoon'):list():prev()
      end,
      desc = 'Harpoon: Go to previous',
    },
    {
      '<A-S-L>',
      function()
        require('harpoon'):list():next()
      end,
      desc = 'Harpoon: Go to next',
    },
  },
}
