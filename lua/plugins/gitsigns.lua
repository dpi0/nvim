return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Toggle diff split (smart)
      local function toggle_diff()
        local diff_mode = false
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          if vim.wo[win].diff then
            diff_mode = true
            break
          end
        end

        if diff_mode then
          vim.cmd 'wincmd p' -- go back to previous window
          vim.cmd 'q' -- close diff split
        else
          gs.diffthis()
        end
      end

      -- Navigation
      map('n', '<leader>bhn', gs.next_hunk, 'Next Hunk')
      map('n', '<leader>bhp', gs.prev_hunk, 'Prev Hunk')

      -- Actions
      map('n', '<leader>bhs', gs.stage_hunk, 'Stage hunk')
      map('n', '<leader>bhr', gs.reset_hunk, 'Reset hunk')
      map('v', '<leader>bhs', function()
        gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, 'Stage hunk')
      map('v', '<leader>bhr', function()
        gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, 'Reset hunk')

      map('n', '<leader>bbs', gs.stage_buffer, 'Stage buffer')
      map('n', '<leader>bbr', gs.reset_buffer, 'Reset buffer')

      map('n', '<leader>bsu', gs.undo_stage_hunk, 'Undo stage hunk')

      map('n', '<leader>bhP', gs.preview_hunk, 'Preview hunk')

      map('n', '<leader>blb', function()
        gs.blame_line { full = true }
      end, 'Blame line')
      map('n', '<leader>bB', gs.toggle_current_line_blame, 'Toggle line blame')

      -- map('n', '<leader>bd', gs.diffthis, 'Diff this')
      map('n', '<leader>bd', toggle_diff, 'Toggle diff split')
      map('n', '<leader>bwd', gs.toggle_word_diff)
      map('n', '<leader>bD', function()
        gs.diffthis '~'
      end, 'Diff this ~')

      -- Text object
      map({ 'o', 'x' }, '<leader>bhS', gs.select_hunk)
    end,

    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    signs_staged = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
}
