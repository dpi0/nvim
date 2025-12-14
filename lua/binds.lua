vim.g.mapleader = ','
vim.g.maplocalleader = ','

local bind = vim.keymap.set
local nopts = { noremap = true, silent = true }

bind('n', '<leader>q', '<cmd>qa<CR>', { desc = 'Quit all' })
bind('n', '<leader>a', 'ggVG', { desc = 'Select all text in buffer' })
bind('n', '<leader>s', '<cmd>w<CR>', { desc = 'Save file' })
bind('i', '<leader>s', '<Esc><cmd>w<CR>', { desc = 'Save file' })
bind('n', '<leader>W', '<cmd>noautocmd w<CR>', { desc = 'Save without auto-formatting' })
bind('n', '<leader>N', '<cmd>enew<CR>', { desc = 'Create a new blank buffer' })
bind('n', '<leader>ll', '<C-w>v', { desc = 'Split vertically (right)' })
bind('n', '<leader>lj', '<C-w>s', { desc = 'Split horizontally (down)' })
bind('n', '<leader>x', '<cmd>!chmod +x %<CR>', { desc = 'Make file executable (chmod +x)' })
bind('n', '<leader>L', '<cmd>Lazy<CR>', { desc = 'Open Lazy Plugin Manager' })
bind('n', '<leader>I', 'mmgg=G`m', { desc = 'Reindent entire buffer' })
bind('n', '<leader>vb', '<C-v>', { noremap = true, desc = 'Enter Visual Block Mode' })
bind('n', '<leader>lw', '<cmd>set wrap!<CR>', { desc = 'Toggle line wrapping' })
bind('n', '<leader>cw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace word globally' })
bind('n', '<leader>flq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
bind('n', '<leader>dip', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { desc = 'Previous diagnostic' })
bind('n', '<leader>din', '<cmd>lua vim.diagnostic.goto_next()<CR>', { desc = 'Next diagnostic' })
bind('n', '<A-q>', '<cmd>q<CR>', { desc = 'Quit current buffer' })
bind('i', '<A-BS>', '<C-w>', { desc = 'Delete word backwards (insert)' })
bind('n', '<A-BS>', 'db', { desc = 'Delete word backwards (normal)' })
bind('n', '<A-a>', '<C-^>', { desc = 'Switch to last buffer (normal)' })
bind('i', '<A-a>', '<Esc><C-^>', { desc = 'Switch to last buffer (insert)' })
bind('n', '<A-d>', 'mz:copy .<CR>`z', vim.tbl_extend('force', nopts, { desc = 'Duplicate line below' }))
bind('n', '<A-v>', 'viw', { desc = 'Visually select the word under the cursor' })
bind('n', '<A-x>', 'ciw', { desc = 'Change the word under the cursor' })
bind('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left buffer' })
bind('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right buffer' })
bind('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower buffer' })
bind('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper buffer' })
bind('n', '<C-right>', '<C-w>>', { desc = 'Increase window width' })
bind('n', '<C-left>', '<C-w><', { desc = 'Decrease window width' })
bind('n', '<C-down>', '<C-w>-', { desc = 'Decrease window height' })
bind('n', '<C-up>', '<C-w>+', { desc = 'Increase window height' })
bind('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
bind('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })
bind('i', '<C-b>', '****<Left><Left>', { desc = 'Insert bold markdown' })
bind('v', '<C-b>', 'c**<C-r>"**<Esc>', { desc = 'Surround selection with bold markdown' })
bind('n', '<S-n>', 'Nzzzv', { desc = 'Previous search result centered' })
bind('n', '<S-h>', '<cmd>Oil --preview<CR>', { desc = 'Go Oil File Explorer (essentially going back)' })
bind('v', 'p', '"_dP', { desc = 'Paste without overwriting register' })
bind('v', '<', '<gv', { desc = 'Indent left and reselect' })
bind('v', '>', '>gv', { desc = 'Indent right and reselect' })
bind('n', ';', 'V', { desc = 'Visual select entire line' })
bind('n', 'n', 'nzzzv', { desc = 'Next search result centered' })
bind('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight with <Esc>' })
bind('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- MULTI-LINE
bind('n', '<leader>S', function()
  vim.ui.input({ prompt = 'Save as: ' }, function(input)
    if input and input ~= '' then
      vim.cmd('write ' .. vim.fn.fnameescape(input))
    end
  end)
end, { desc = 'Save file as...' })

bind('n', '<A-S-c>', function()
  vim.cmd 'normal! vip'
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<A-c>', true, false, true), 'x', false)
end, vim.tbl_extend('force', nopts, { desc = 'Comment paragraph using MiniComment' }))

bind('n', '<A-o>', function()
  if vim.bo.filetype == 'oil' then
    require('oil.actions').close.callback()
  else
    vim.cmd 'Oil --preview'
  end
end, { desc = 'Toggle Oil file explorer' })

bind('n', '<A-y>', function()
  local pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd 'normal! gg0vG$y'
  vim.api.nvim_win_set_cursor(0, pos)
end, { desc = 'Copy entire buffer and restore cursor' })

-- https://www.reddit.com/r/neovim/comments/1jm5atz/replacing_vimdiagnosticopen_float_with_virtual
bind('n', '<leader>k', function()
  vim.diagnostic.config { virtual_lines = { current_line = true }, virtual_text = false }

  vim.api.nvim_create_autocmd('CursorMoved', {
    group = vim.api.nvim_create_augroup('line-diagnostics', { clear = true }),
    callback = function()
      vim.diagnostic.config { virtual_lines = false, virtual_text = true }
      return true
    end,
  })
end, { desc = 'Show exact diagnostics on a diagnostic line' })
