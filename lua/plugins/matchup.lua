return {
  'andymass/vim-matchup',
  event = 'BufReadPost',
  ---@type matchup.Config
  opts = {
    treesitter = {
      stopline = 500,
    },
  },
  config = function()
    vim.g.matchup_matchparen_offscreen = { method = 'status_manual' }

    -- Custom highlighting for matching brackets
    vim.api.nvim_set_hl(0, 'MatchParen', {
      fg = '#00F1F7', -- Red color for matching brackets
      bold = true, -- Make them bold
      underline = true, -- Optional: add underline for more emphasis
    })

    -- Alternative: Use a different color scheme
    -- vim.api.nvim_set_hl(0, 'MatchParen', {
    --   fg = '#4ecdc4',  -- Teal color
    --   bg = '#2d3748',  -- Dark background
    --   bold = true
    -- })
  end,
}
