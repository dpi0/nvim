-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    vim.cmd 'colorscheme kanagawa-wave'
  end,
})


-- vim.api.nvim_create_autocmd("ColorScheme", {
--   pattern = "*",
--   callback = function()
--     vim.cmd([[
--       highlight Normal      guibg=NONE ctermbg=NONE
--       highlight NormalNC    guibg=NONE ctermbg=NONE
--       highlight SignColumn  guibg=NONE ctermbg=NONE
--       highlight VertSplit   guibg=NONE ctermbg=NONE
--       highlight StatusLine  guibg=NONE ctermbg=NONE
--       highlight LineNr      guibg=NONE ctermbg=NONE
--       highlight Folded      guibg=NONE ctermbg=NONE
--       highlight EndOfBuffer guibg=NONE ctermbg=NONE
--     ]])
--   end
-- })
