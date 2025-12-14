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

local plugins = {
  require 'plugins.theme', -- color scheme (currently kanagawa)
  require 'plugins.fzf', -- /ibhagwan/fzf-lua ❤️ ⭐ (find anything - files, binds, words)
  require 'plugins.oil', -- stevearc/oil.nvim ⭐ (manage files)
  require 'plugins.flash', -- folke/flash.nvim ⭐ (go anywhere in visible buffer)
  require 'plugins.harpoon', -- cbochs/grapple.nvim ⭐ (better than ThePrimeagen/harpoon/tree/harpoon2 - quickly goto to set files)
  require 'plugins.terminal', -- dpi0/fim.nvim ⭐ (floating terminal)
  require 'plugins.lsp', -- neovim/nvim-lspconfig and mason-org/mason.nvim (LSP and Mason plugin manager)
  require 'plugins.formatter', -- stevearc/conform.nvim (formatter)
  require 'plugins.linter', -- mfussenegger/nvim-lint (linter)
  require 'plugins.completion', -- Saghen/blink.cmp (completion engine)
  require 'plugins.treesitter', -- nvim-treesitter/nvim-treesitter (treesitter)
  require 'plugins.substitute', -- gbprod/substitute.nvim (quickly delete and replace text by pasting from clipboard)
  require 'plugins.snacks', -- folke/snacks.nvim (many little plugins of which i mainly use: input, notifier, lazygit and toggle)
  require 'plugins.mini-comment', -- nvim-mini/mini.comment (comment)
  require 'plugins.mini-surround', -- nvim-mini/mini.surround (add brackets, quotes around selected text)
  require 'plugins.mini-move', -- nvim-mini/mini.cursorword (move text up/down/left/right)
  require 'plugins.mini-cursorword', -- nvim-mini/mini.cursorword (highlights matching words under cursor)
  require 'plugins.mini-ai', -- nvim-mini/mini.ai (text objects)
  require 'plugins.autopairs', -- windwp/nvim-autopairs (auto add bracket, quotes pairs - better than mini.pairs)
  require 'plugins.which-key', -- folke/which-key.nvim (helps with complicated/forgetful leader based keybinds)
  require 'plugins.todo-comments', -- folke/todo-comments.nvim (highlight keywords in comments)
  require 'plugins.colorizer', -- catgoose/nvim-colorizer (highlight colors)
  require 'plugins.gitsigns', -- lewis6991/gitsigns.nvim (show git status in statuscolumn, hunk mgnment, blame)
  require 'plugins.multicursors', -- mg979/vim-visual-multi (multiple cursors)
  require 'plugins.bullets', -- bullets-vim/bullets.vim (auto complete bullet lists in markdown)
  require 'plugins.headlines', -- lukas-reineke/headlines.nvim (highlight headings in markdown - cleaner than MeanderingProgrammer/render-markdown.nvim)
  require 'plugins.git-fugitive', -- tpope/vim-fugitive (very nice git helper)
  require 'plugins.dial', -- monaqa/dial.nvim (advanced CTRL+A to increment/decrement, can also control strings)
  require 'plugins.dropbar', -- Bekaboo/dropbar.nvim (breadcrumbs + nice navigation on top of buffer)
  require 'plugins.titlecase', -- christoomey/vim-titlecase (Convert selected text to Title Case)
  require 'plugins.lastplace', -- farmergreg/vim-lastplace (Reopen file at the last place you left it at)
  require 'plugins.sleuth', -- tpope/vim-sleuth (set the expandtab, shiftwidth, tabstop and tabstop opt values intelligently for the buffer)
  require 'plugins.tiny-diagnostics', -- rachartier/tiny-inline-diagnostic.nvim (Better inline diagnostic messages)
  require 'plugins.outline', -- hedyhli/outline.nvim (tree view of symbols/headings)
  require 'plugins.nvim-ansible', -- mfussenegger/nvim-ansible (adds support ansible detection for yaml files)
  require 'plugins.freeze', -- charm-and-friends/freeze.nvim (code screenshots using freeze)
  require 'plugins.fold', -- kevinhwang91/nvim-ufo (better code folding)
  require 'plugins.flutter', -- nvim-flutter/flutter-tools.nvim (flutter support)
  require 'plugins.autotag', -- windwp/nvim-ts-autotag (auto change/close html tags)
  --
  require 'plugins.moo', -- testing dpi0/moo.nvim
  --
  -- require 'plugins.matchup', -- andymass/vim-matchup (highlight matching brackets)
  -- require 'plugins.treesitter-context', -- nvim-treesitter/nvim-treesitter-context (when scrolling show top level code elements)
  -- require 'plugins.spectre', -- nvim-pack/nvim-spectre (global replace text)
  -- require 'plugins.tpipeline', -- vimpostor/vim-tpipeline (merge nvim's statusline with tmux's)
  -- require 'plugins.indent', -- lukas-reineke/indent-blankline.nvim + TheGLander/indent-rainbowline.nvim (to get rainbow indents)
}

require('lazy').setup(plugins, {
  install = { colorscheme = { 'habamax' } },
  checker = { enabled = true, notify = false },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
