vim.g.mapleader = ','
vim.g.maplocalleader = ','

local bind = vim.keymap.set
local nopts = { noremap = true, silent = true }

bind('n', '<leader>q', '<cmd>qa<CR>', { desc = 'Quit all' })
bind('n', '<leader>a', 'ggVG', { desc = 'Select all text in buffer' })
bind('n', '<leader>N', '<cmd>enew<CR>', { desc = 'Create a new blank buffer' })
bind('n', '<leader>sn', '<cmd>noautocmd w<CR>', { desc = 'Save without auto-formatting' })
bind('n', '<Leader>vb', '<C-v>', { noremap = true, desc = 'Enter Visual Block Mode' })
bind('n', '<leader>spl', '<C-w>v', { desc = 'Split vertically' })
bind('n', '<leader>spj', '<C-w>s', { desc = 'Split horizontally' })
bind('n', '<leader>lw', '<cmd>set wrap!<CR>', { desc = 'Toggle line wrapping' })
bind('n', '<leader>cw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace word globally' })
bind('n', '<leader>W', function()
  vim.ui.input({ prompt = 'Save as: ' }, function(input)
    if input and input ~= '' then
      vim.cmd('write ' .. vim.fn.fnameescape(input))
    end
  end)
end, { desc = 'Save file as...' })
bind('n', '<leader>flq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
bind('n', '<leader>x', '<cmd>!chmod +x %<CR>', { desc = 'Make file executable (chmod +x)' })
bind('n', '<leader>L', '<cmd>Lazy<CR>', { desc = 'Open Lazy Plugin Manager' })
bind('n', '<leader>dip', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { desc = 'Previous diagnostic' })
bind('n', '<leader>din', '<cmd>lua vim.diagnostic.goto_next()<CR>', { desc = 'Next diagnostic' })
bind('n', '<leader>dsh', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = 'Show diagnostics' })
bind('n', '<leader>dsl', '<cmd>lua vim.diagnostic.setloclist()<CR>', { desc = 'Show diagnostic list' })
bind('n', '<leader>i2', '<cmd>set tabstop=2 shiftwidth=2 expandtab | retab<CR>', { desc = 'Set 2-space indent' })
bind('n', '<Leader>I', 'gg=G', { desc = 'Reindent entire buffer' })
bind('n', '<leader>i4', function()
  vim.cmd 'set tabstop=4 shiftwidth=4 noexpandtab'
  vim.cmd 'retab!'
end, { desc = 'Set 4-space indent with tabs' })
bind('n', '<leader>P', function()
  local filepath = vim.fn.expand '%:p'
  vim.notify(filepath, vim.log.levels.INFO, { title = 'Current File Path' })
end, { desc = 'Notify absolute path of current file' })

bind('n', '<A-;>', 'v$', { desc = 'Visual select entire line' })
bind('n', '<A-q>', '<cmd>q<CR>', { desc = 'Quit current buffer' })
bind('n', '<A-e>', '$', { desc = 'Go to end of current line' })
bind('n', '<A-S-c>', function()
  vim.cmd 'normal! vip'
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<A-c>', true, false, true), 'x', false)
end, vim.tbl_extend('force', nopts, { desc = 'Comment paragraph using MiniComment' }))
bind('n', '<A-o>', '<cmd>OilToggle<CR>', { desc = 'Toggle Oil file explorer' })
bind('i', '<A-BS>', '<C-w>', { desc = 'Delete word backwards (insert)' })
bind('n', '<A-BS>', 'db', { desc = 'Delete word backwards (normal)' })
bind('n', '<A-a>', '<C-^>', { desc = 'Switch to last buffer (normal)' })
bind('i', '<A-a>', '<Esc><C-^>', { desc = 'Switch to last buffer (insert)' })
bind('n', '<A-d>', 'mz:copy .<CR>`z', vim.tbl_extend('force', nopts, { desc = 'Duplicate line below' }))
bind('n', '<A-v>', 'viw', { desc = 'Visually select the word under the cursor' })
bind('n', '<A-x>', 'ciw', { desc = 'Change the word under the cursor' })
bind('n', '<A-b>', '%', { desc = 'Go to bracket' })
bind('n', '<A-y>', function()
  local pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd 'normal! gg0vG$y'
  vim.api.nvim_win_set_cursor(0, pos)
end, { desc = 'Copy entire buffer and restore cursor' })
bind('n', '<A-p>', function()
  local indent = vim.fn.indent '.'
  local content = vim.fn.getreg('+', 1, true)
  for i, line in ipairs(content) do
    content[i] = string.rep(' ', indent) .. line
  end
  vim.fn.append(vim.fn.line '.', content)
end, { desc = 'Paste clipboard below with matched indent' })
bind('n', '<A-S-p>', function()
  local indent = vim.fn.indent '.'
  local content = vim.fn.getreg('+', 1, true)
  for i, line in ipairs(content) do
    content[i] = string.rep(' ', indent) .. line
  end
  vim.fn.append(vim.fn.line '.' - 1, content)
end, { desc = 'Paste clipboard above with matched indent' })
bind('n', '<A-S-d>', function()
  local pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd 'normal! _v$hd'
  vim.api.nvim_win_set_cursor(0, pos)
end, vim.tbl_extend('force', nopts, { desc = 'Delete text between _ and $ without newline' }))
bind('n', '<A-S-y>', function()
  local pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd 'normal! _v$hy'
  vim.api.nvim_win_set_cursor(0, pos)
end, vim.tbl_extend('force', nopts, { desc = 'Yank text between _ and $ without newline' }))
bind('n', '<C-;>', function()
  vim.cmd 'normal! ;'
end, { desc = 'Native repeat f/t/F/T motion' })
bind('n', '<C-s>', '<cmd>w<CR>', { desc = 'Save file' })
bind('i', '<C-s>', '<Esc><cmd>w<CR>', { desc = 'Save file' })
bind('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
bind('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
bind('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
bind('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
bind('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
bind('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })
bind('i', '<C-b>', '****<Left><Left>', { desc = 'Insert bold markdown' })
bind('v', '<C-b>', 'c**<C-r>"**<Esc>', { desc = 'Surround selection with bold markdown' })
bind('v', 'p', '"_dP', { desc = 'Paste without overwriting register' })
bind('v', '<', '<gv', { desc = 'Indent left and reselect' })
bind('v', '>', '>gv', { desc = 'Indent right and reselect' })
bind('v', '<Tab>', '>gv', { desc = 'Indent right' })
bind('v', '<S-Tab>', '<gv', { desc = 'Indent left' })
bind('n', 'Y', 'y$', { desc = 'Copy till end of line from current position' })
bind('n', ';', 'V', { desc = 'Visual select entire line' })
bind('n', 'n', 'nzzzv', { desc = 'Next search result centered' })
bind('n', 'N', 'Nzzzv', { desc = 'Previous search result centered' })
bind('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight with <Esc>' })
bind('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
