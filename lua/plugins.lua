-- https://lazy.folke.io/installation

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  require 'plugins.theme',
  require 'plugins.fzf',
  require 'plugins.oil',
  require 'plugins.harpoon',
  require 'plugins.snacks',
  require 'plugins.yazi',
  require 'plugins.terminal',
  require 'plugins.mini-comment',
  require 'plugins.mini-surround',
  require 'plugins.mini-ai',
  require 'plugins.mini-move',
  require 'plugins.mini-pairs',
  require 'plugins.mini-cursorword',
  require 'plugins.treesitter',
  require 'plugins.treesitter-text-objects',
  require 'plugins.statusline',
}, {
  checker = { enabled = true },
  -- -- https://github.com/adibhanna/minimal-vim/blob/main/lua/core/lazy.lua
  performance = {
    rtp = {
      disabled_plugins = {
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
