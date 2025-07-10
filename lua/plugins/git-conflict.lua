return {
  'akinsho/git-conflict.nvim',
  event = 'BufEnter',
  version = '*',
  config = true,
  opts = {
    default_mappings = true, -- disable buffer local mapping created by this plugin
    default_commands = true, -- disable commands created by this plugin
    disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
    list_opener = 'copen', -- command or function to open the conflicts list
    highlights = { -- They must have background color, otherwise the default color will be used
      incoming = 'DiffAdd',
      current = 'DiffText',
    },
  },
  keys = {
    { '<leader>gco', '<cmd>GitConflictChooseOurs<cr>', desc = 'Git Conflict: Choose Ours', mode = 'n' },
    { '<leader>gct', '<cmd>GitConflictChooseTheirs<cr>', desc = 'Git Conflict: Choose Theirs', mode = 'n' },
    { '<leader>gcb', '<cmd>GitConflictChooseBoth<cr>', desc = 'Git Conflict: Choose Both', mode = 'n' },
    { '<leader>gc0', '<cmd>GitConflictChooseNone<cr>', desc = 'Git Conflict: Choose None', mode = 'n' },
    { '<leader>gcn', '<cmd>GitConflictNextConflict<cr>', desc = 'Git Conflict: Next Conflict', mode = 'n' },
    { '<leader>gcp', '<cmd>GitConflictPrevConflict<cr>', desc = 'Git Conflict: Prev Conflict', mode = 'n' },
    -- { '<leader>gC', '<cmd>GitConflictListQf<cr>', desc = 'Git Conflict: List Quickfix', mode = 'n' },
  },
}
