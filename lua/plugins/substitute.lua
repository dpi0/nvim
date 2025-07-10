return {
  'gbprod/substitute.nvim',
  opts = {},
  keys = {
    {
      'q',
      function()
        require('substitute').operator()
      end,
      mode = 'n',
      desc = 'Substitute with motion',
    },
    {
      'qq',
      function()
        require('substitute').line()
      end,
      mode = 'n',
      desc = 'Substitute line',
    },
    {
      'Q',
      function()
        require('substitute').eol()
      end,
      mode = 'n',
      desc = 'Substitute to EOL',
    },
    {
      'q',
      function()
        require('substitute').visual()
      end,
      mode = 'x',
      desc = 'Substitute selection',
    },
    {
      '<leader>n',
      function()
        require('substitute.range').operator()
      end,
      mode = 'n',
      desc = 'Substitute operator (range)',
    },
    {
      '<leader>n',
      function()
        require('substitute.range').visual()
      end,
      mode = 'x',
      desc = 'Substitute visual selection (range)',
    },
    {
      '<leader>nn',
      function()
        require('substitute.range').word()
      end,
      mode = 'n',
      desc = 'Substitute word (range)',
    },
    {
      'nx',
      function()
        require('substitute.exchange').operator()
      end,
      mode = 'n',
      desc = 'Exchange with motion',
    },
    {
      'nxx',
      function()
        require('substitute.exchange').line()
      end,
      mode = 'n',
      desc = 'Exchange line',
    },
    {
      'X',
      function()
        require('substitute.exchange').visual()
      end,
      mode = 'x',
      desc = 'Exchange selection',
    },
    {
      'nxc',
      function()
        require('substitute.exchange').cancel()
      end,
      mode = 'n',
      desc = 'Cancel exchange',
    },
  },
}
