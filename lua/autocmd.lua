-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- https://gist.github.com/smnatale/692ac4f256d5f19fbcbb78fe32c87604
-- Do not continue the comment on next line
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('no_auto_comment', {}),
  callback = function()
    vim.opt_local.formatoptions:remove { 'c', 'r', 'o' }
  end,
})

-- Set filetype for certain file names so that the Language servers can recognize them
local function set_filetype(pattern, filetype)
  vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = pattern,
    command = 'set filetype=' .. filetype,
  })
end

set_filetype({ 'compose.yaml' }, 'yaml.docker-compose')
-- set_filetype({ 'playbook.yaml', 'playbook.yml' }, 'yaml.ansible') -- Using mfussenegger/nvim-ansible for this
