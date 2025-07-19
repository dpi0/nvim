return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  ---@type Flash.Config
  opts = {},
  config = function()
    require('flash').setup {}
    vim.api.nvim_set_hl(0, 'FlashMatch', { fg = '#F77C00', bold = true })
    vim.api.nvim_set_hl(0, 'FlashLabel', { fg = '#FEFE33', bold = true })
    vim.api.nvim_set_hl(0, 'FlashCurrent', { fg = '#00FFFF', bold = true })
    vim.api.nvim_set_hl(0, 'FlashCursor', { fg = '#00FF00', bold = true })
  end,
  keys = {
    {
      -- stylua: ignore
      "'",
      -- "<Tab>",
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump()
      end,
      desc = 'Flash',
    },
    {
      'S',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').treesitter()
      end,
      desc = 'Flash Treesitter',
    },
    {
      'r',
      mode = 'o',
      function()
        require('flash').remote()
      end,
      desc = 'Remote Flash',
    },
    {
      'R',
      mode = { 'o', 'x' },
      function()
        require('flash').treesitter_search()
      end,
      desc = 'Treesitter Search',
    },
    {
      '<c-s>',
      mode = { 'c' },
      function()
        require('flash').toggle()
      end,
      desc = 'Toggle Flash Search',
    },
  },
}
