return {
  'echasnovski/mini.move',
  event = 'VeryLazy',
  version = '*',
  opts = {
    mappings = {
      -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
      left = '<M-h>',
      right = '<M-l>',
      down = '<M-j>',
      up = '<M-k>',

      -- Move current line in Normal mode
      line_left = '<M-h>',
      line_right = '<M-l>',
      line_down = '<M-j>',
      line_up = '<M-k>',
    },

    -- Options which control moving behavior
    options = {
      -- Automatically reindent selection during linewise vertical move
      reindent_linewise = true,
    },
  },
}
