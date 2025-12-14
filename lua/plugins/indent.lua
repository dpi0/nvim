return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl', -- new v3 API
  opts = function(_, opts)
    -- Other blankline configuration here
    opts = require('indent-rainbowline').make_opts(opts, {
      -- How transparent should the rainbow colors be. 1 is completely opaque, 0 is invisible. 0.07 by default
      color_transparency = 0.08,
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
}
