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

local hostname = vim.loop.os_gethostname()

local plugins = {
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
  require 'plugins.autopairs',
  require 'plugins.mini-cursorword',
  require 'plugins.statusline',
  require 'plugins.which-key',
  require 'plugins.cmp',
  require 'plugins.colorizer',
  require 'plugins.gitsigns',
  require 'plugins.multicursors',
  require 'plugins.todo-comments',
  require 'plugins.undo',
  require 'plugins.spectre',
  require 'plugins.sleuth',
  require 'plugins.diff',
  require 'plugins.bullets',
  require 'plugins.outline',
  require 'plugins.headlines',
  require 'plugins.treesitter-context',
  -- require 'plugins.dashboard',
  require 'plugins.substitute',
}

-- Conditionally add machine-specific plugins
if hostname == 'titan' then
  vim.list_extend(plugins, {
    require 'plugins.lsp',
    require 'plugins.formatter',
    require 'plugins.linter',
    require 'plugins.mini-snippets',
    require 'plugins.activity-watcher',
    require 'plugins.treesitter',
    require 'plugins.treesitter-text-objects',
  })
end

require('lazy').setup(plugins, {
  checker = { enabled = true, notify = false },
  performance = {
    rtp = {
      disabled_plugins = {
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
