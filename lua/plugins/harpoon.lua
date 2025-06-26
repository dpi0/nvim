return {
  'cbochs/grapple.nvim',
  event = 'VeryLazy',
  -- event = { 'BufReadPost', 'BufNewFile' },
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', lazy = true },
  },
  cmd = 'Grapple',
  opts = {
    scope = 'git', -- also try out "git_branch"
    icons = true, -- setting to "true" requires "nvim-web-devicons"
    status = true,
  },
  keys = {
    { '<leader>j', '<cmd>Grapple toggle_tags<cr>', desc = 'Toggle tags menu' },
    { '<leader>p', '<cmd>Grapple toggle<cr>', desc = 'Tag a file' },
    -- { '<A-e>', '<cmd>Grapple toggle<cr>', desc = 'Tag a file' },

    { '<A-1>', '<cmd>Grapple select index=1<cr>' },
    { '<A-2>', '<cmd>Grapple select index=2<cr>' },
    { '<A-3>', '<cmd>Grapple select index=3<cr>' },
    { '<A-4>', '<cmd>Grapple select index=4<cr>' },
    { '<A-0>', '<cmd>Grapple select index=5<cr>' },
    { '<A-9>', '<cmd>Grapple select index=6<cr>' },
    { '<A-8>', '<cmd>Grapple select index=7<cr>' },
    { '<A-7>', '<cmd>Grapple select index=8<cr>' },
    { '<A-6>', '<cmd>Grapple select index=9<cr>' },

    -- { '<c-s-n>', '<cmd>Grapple cycle_tags next<cr>', desc = 'Go to next tag' },
    -- { '<c-s-p>', '<cmd>Grapple cycle_tags prev<cr>', desc = 'Go to previous tag' },
  },
}
