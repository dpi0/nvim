return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  -- textobjects allows even better understanding of code
  -- and adds even more textobjects to the default treesitter
  -- list of new objects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects#built-in-textobjects
  -- like for a function or class (not just words)
  -- even comments are proper objects to manipulate now
  -- like loop, number, conditional etc
  -- taken directly
  -- https://github.com/jakobwesthoff/nvim-from-scratch/blob/series/02/lua/plugins/nvim-treesitter-textobjects.lua
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter"
  },
  init = function()
    local config = require'nvim-treesitter.configs';
    config.setup({
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            -- using the Xf you can now select functions
            -- like inside function using 'vif'
            -- or around function using 'vaf'
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            -- for a class as well
            ["ac"] = "@class.outer",
            -- even for comments, 'vio' to select inside comment, 'vao' to select around comment
            ["ao"] = "@comment.outer",
            ["io"] = "@comment.inner",
            -- You can optionally set descriptions to the mappings (used in the desc parameter of
            -- nvim_buf_set_keymap) which plugins like which-key display
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            -- You can also use captures from other query groups like `locals.scm`
            ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
          },
          -- You can choose the select mode (default is charwise 'v')
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * method: eg 'v' or 'o'
          -- and should return the mode ('v', 'V', or '<c-v>') or a table
          -- mapping query_strings to modes.
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V', -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * selection_mode: eg 'v'
          -- and should return true or false
          include_surrounding_whitespace = true,
        },
        -- allows you swap objects
        -- like swap 2 parameters of a function using <leader>a
        -- don't know how useful this is
        -- list also swap things in a list
        -- example; https://www.youtube.com/watch?v=E4qXZv34NQQ&t=2945s
        swap = {
          enable = true,
          swap_next = {
            ["<leader>so"] = {query="@parameter.inner", desc="Swap with next parameter"},
          },
          swap_previous = {
            ["<leader>sO"] = "@parameter.inner",
          },
        },
      },
    });
  end
}
