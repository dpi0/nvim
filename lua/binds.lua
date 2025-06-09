vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.keymap.set('n', '<leader>q', '<cmd>qa<CR>', { desc = 'Quit all' })
vim.keymap.set('n', '<leader>a', 'ggVG', { desc = 'Select all text in buffer' })
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w<CR>', { desc = 'Save without auto-formatting' })
vim.keymap.set('n', '<Leader>vb', '<C-v>', { noremap = true, desc = 'Enter Visual Block Mode' })
vim.keymap.set('n', '<leader>spl', '<C-w>v', { desc = 'Split vertically' })
vim.keymap.set('n', '<leader>spj', '<C-w>s', { desc = 'Split horizontally' })
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', { desc = 'Toggle line wrapping' })
vim.keymap.set(
  'n',
  '<leader>cw',
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = 'Replace word globally' }
)
vim.keymap.set('n', '<leader>flq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { desc = 'Make file executable (chmod +x)' })
vim.keymap.set('n', '<leader>L', '<cmd>Lazy<CR>', { desc = 'Open Lazy Plugin Manager' })
vim.keymap.set('n', '<leader>dip', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { desc = 'Previous diagnostic' })
vim.keymap.set('n', '<leader>din', '<cmd>lua vim.diagnostic.goto_next()<CR>', { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>dsh', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = 'Show diagnostics' })
vim.keymap.set('n', '<leader>dsl', '<cmd>lua vim.diagnostic.setloclist()<CR>', { desc = 'Show diagnostic list' })
vim.keymap.set(
  'n',
  '<leader>i2',
  '<cmd>set tabstop=2 shiftwidth=2 expandtab | retab<CR>',
  { desc = 'Set 2-space indent' }
)
vim.keymap.set('n', '<Leader>I', 'gg=G', { desc = 'Reindent entire buffer' })
vim.keymap.set('n', '<leader>i4', function()
  vim.cmd 'set tabstop=4 shiftwidth=4 noexpandtab'
  vim.cmd 'retab!'
end, { desc = 'Set 4-space indent with tabs' })

vim.keymap.set('n', '<A-q>', '<cmd>q<CR>', { desc = 'Quit current buffer' })
vim.keymap.set('n', '<A-o>', '<cmd>OilToggle<CR>', { desc = 'Toggle Oil file explorer' })
vim.keymap.set('i', '<A-BS>', '<C-w>', { desc = 'Delete word backwards (insert)' })
vim.keymap.set('n', '<A-BS>', 'db', { desc = 'Delete word backwards (normal)' })
vim.keymap.set('n', '<A-a>', '<C-^>', { desc = 'Switch to last buffer (normal)' })
vim.keymap.set('i', '<A-a>', '<Esc><C-^>', { desc = 'Switch to last buffer (insert)' })
-- vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
-- vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
-- vim.keymap.set('x', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
-- vim.keymap.set('x', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })
vim.keymap.set('n', '<A-d>', 'yyp', { desc = 'Duplicate line below' })
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', { desc = 'Save file' })
vim.keymap.set('i', '<C-s>', '<Esc><cmd>w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })
vim.keymap.set('i', '<C-b>', '****<Left><Left>', { desc = 'Insert bold markdown' })
vim.keymap.set('v', '<C-b>', 'c**<C-r>"**<Esc>', { desc = 'Surround selection with bold markdown' }) -- Ctrl+i or C-S-i doesn't work, interpreted as <Tab> in nvim
vim.keymap.set('v', 'p', '"_dP', { desc = 'Paste without overwriting register' })
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and reselect' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and reselect' })
vim.keymap.set('v', '<Tab>', '>gv', { desc = 'Indent right' })
vim.keymap.set('v', '<S-Tab>', '<gv', { desc = 'Indent left' })
vim.keymap.set('n', 'Y', 'y$', { desc = 'Copy till end of line from current position' })
vim.keymap.set('n', 'vv', 'V', { desc = 'Visual select entire line' })
vim.keymap.set('n', 've', 'v$', { desc = 'Visual select till end of line from current position' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result centered' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result centered' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight with <Esc>' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- load binds.lua before plugins are loaded
-- reference: https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
