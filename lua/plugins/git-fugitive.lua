return {
  'tpope/vim-fugitive',
  event = 'BufEnter',
  keys = {
    -- Git status (main entry point, like Magit)
    { '<leader>gs', '<cmd>Git<CR>', desc = 'Fugitive: Git status' },
    -- Git blame for current file
    { '<leader>gB', '<cmd>Git blame<CR>', desc = 'Fugitive: Git blame' },
    -- Git log for current file
    { '<leader>gl', '<cmd>Git log<CR>', desc = 'Fugitive: Git log' },
    -- Git diff for current file (80% height)
    {
      '<leader>gd',
      function()
        vim.cmd 'Git -c pager.diff=delta diff %'
        -- Resize the fugitive window to 80% of screen height
        vim.cmd('resize ' .. math.floor(vim.o.lines * 0.8))
      end,
      desc = 'Fugitive: Git diff (delta, current file, 80% height)',
    },
    -- Git add current file
    { '<leader>ga', '<cmd>Git add %<CR>', desc = 'Fugitive: Git add current file' },
    -- Git commit
    { '<leader>gC', '<cmd>Git commit<CR>', desc = 'Fugitive: Git commit' },
    -- Git push
    { '<leader>gp', '<cmd>Git push<CR>', desc = 'Fugitive: Git push' },
    -- Git pull
    { '<leader>gP', '<cmd>Git pull<CR>', desc = 'Fugitive: Git pull' },
    -- Git checkout branch
    { '<leader>go', '<cmd>Git checkout<CR>', desc = 'Fugitive: Git checkout branch' },
    -- Git stash
    { '<leader>gS', '<cmd>Git stash<CR>', desc = 'Fugitive: Git stash' },
    { '<leader>gU', '<cmd>Git stash pop<CR>', desc = 'Fugitive: Git stash pop' },
  },
}
