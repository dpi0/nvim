return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl', -- new v3 API
  opts = function(_, opts)
    -- Other blankline configuration here
    opts = require('indent-rainbowline').make_opts(opts, {
      -- How transparent should the rainbow colors be. 1 is completely opaque, 0 is invisible. 0.07 by default
      color_transparency = 0.08,
      -- The 24-bit colors to mix with the background. Specified in hex.
      -- { 0xffff40, 0x79ff79, 0xff79ff, 0x4fecec, } by default
      -- colors = { 0xff0000, 0x00ff00, 0x0000ff },
    })
    opts.indent = {
      char = '┊',
    }
    opts.scope = {
      char = '┊',
    }
  end,
  dependencies = {
    'TheGLander/indent-rainbowline.nvim',
  },
  -- config = function()
  --   local highlight = {
  --     'IndentRainbowLevel1',
  --     'IndentRainbowLevel2',
  --     'IndentRainbowLevel3',
  --     'IndentRainbowLevel4',
  --     'IndentRainbowLevel5',
  --     'IndentRainbowLevel6',
  --     'IndentRainbowLevel7',
  --   }

  --   vim.api.nvim_set_hl(0, 'IndentRainbowLevel1', { bg = '#3b2b3b', blend = 90 }) -- Violet
  --   vim.api.nvim_set_hl(0, 'IndentRainbowLevel2', { bg = '#2b2b3b', blend = 90 }) -- Indigo
  --   vim.api.nvim_set_hl(0, 'IndentRainbowLevel3', { bg = '#2b3b4b', blend = 90 }) -- Blue
  --   vim.api.nvim_set_hl(0, 'IndentRainbowLevel4', { bg = '#2b3b2b', blend = 90 }) -- Green
  --   vim.api.nvim_set_hl(0, 'IndentRainbowLevel5', { bg = '#3b3b2b', blend = 90 }) -- Yellow
  --   vim.api.nvim_set_hl(0, 'IndentRainbowLevel6', { bg = '#4b3b2b', blend = 90 }) -- Orange
  --   vim.api.nvim_set_hl(0, 'IndentRainbowLevel7', { bg = '#4b2b2b', blend = 90 }) -- Red

  --   require('ibl').setup {
  --     indent = {
  --       highlight = highlight,
  --       char = ' ', -- invisible char, so only bg color shows
  --     },
  --     whitespace = {
  --       highlight = highlight,
  --       remove_blankline_trail = false,
  --     },
  --     scope = { enabled = false },
  --   }
  -- end,
}
