vim.o.number = true -- Enable line numbers
vim.o.relativenumber = true -- Use relative line numbers
vim.o.signcolumn = 'yes' -- Always show signcolumn
vim.o.numberwidth = 4 -- Set number column width
vim.o.cursorline = true -- Highlight current line
vim.o.wrap = false -- Disable line wrapping
vim.o.linebreak = true -- Prevent word splitting when wrapped
vim.o.colorcolumn = '80' -- Highlight column at 80 chars
vim.o.showmode = false -- Hide mode info (redundant with statusline)
vim.o.cmdheight = 1 -- Space in command line for messages
vim.o.termguicolors = true -- Enable 24-bit colors
vim.o.list = true -- Show whitespace characters
vim.o.inccommand = 'split' -- -- Preview substitutions live, as you type!
vim.o.listchars = 'tab:. ,trail:·,nbsp:␣' -- Customize whitespace display
vim.o.clipboard = 'unnamedplus' -- Sync system clipboard
vim.o.mouse = 'a' -- Enable mouse support
vim.o.whichwrap = 'bs<>[]hl' -- Allow moving across lines with arrow keys
vim.o.autoindent = true -- Copy indentation from current line
vim.o.smartindent = true -- Smarter indentation
vim.o.breakindent = true -- Enable break indent
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.shiftwidth = 2 -- Spaces per indentation level
vim.o.tabstop = 2 -- Tab width
vim.o.softtabstop = 2 -- Spaces a tab represents in editing
vim.o.splitbelow = true -- Horizontal splits appear below
vim.o.splitright = true -- Vertical splits appear to the right
vim.o.scrolloff = 8 -- Keep n lines visible when scrolling
vim.o.sidescrolloff = 8 -- Keep n columns visible when scrolling
vim.o.confirm = true -- raise a dialog asking if you wish to save the current file(s)
vim.o.lazyredraw = false -- Don't redraw during macros/scripts
vim.o.updatetime = 50 -- Faster update time (default: 4000ms)
vim.o.timeoutlen = 500 -- Faster key sequence timeout (default: 1000ms)
vim.o.swapfile = false -- Disable swapfile
vim.o.backup = false -- Disable backup files
vim.o.writebackup = false -- Prevent editing files that are open elsewhere
vim.o.undofile = true -- Enable persistent undo
vim.o.fileencoding = 'utf-8' -- Set file encoding
vim.o.conceallevel = 0 -- Show markdown code blocks
vim.o.showtabline = 0 -- Show tab line
vim.o.pumheight = 10 -- Popup menu height
vim.o.ignorecase = true -- Case-insensitive search
vim.o.smartcase = true -- Case-sensitive if mixed-case search
vim.o.incsearch = true -- Show incremental matches
vim.o.hlsearch = true -- Highlight search results
vim.o.spell = true -- Enable spell checking
vim.o.spelllang = 'en_us' -- Set spell check language
vim.o.foldmethod = 'expr' -- https://reddit.dpi0.cloud/r/neovim/comments/1behv16/help_with_configuring_this_plugin_nvimufo/
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- :h vim.treesitter.foldexpr()
vim.o.foldtext = '' -- ref: https://github.com/neovim/neovim/pull/20750
vim.o.foldlevelstart = 99 -- Open all folds by default, zm is not available
vim.g.have_nerd_font = true -- Enable NERD font compatibility
vim.o.backspace = 'indent,eol,start' -- Allow backspacing over everything

-- NEOVIDE Configuration
if vim.g.neovide then
  vim.o.guifont = 'JetBrainsMono NF:h12'
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_trail_size = 0.1
  vim.g.neovide_scroll_animation_length = 0.1
  vim.g.neovide_refresh_rate = 120
  vim.g.neovide_no_idle = true
  vim.g.neovide_fullscreen = false
  vim.g.neovide_remember_window_size = false
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  vim.g.neovide_opacity = 0.8
  local map = vim.keymap.set
  map('n', '<C-s>', ':w<CR>') -- Save
  map('v', '<C-c>', '"+y') -- Copy
  map('n', '<C-v>', '"+P') -- Paste (normal mode)
  map('v', '<C-v>', '"+P') -- Paste (visual mode)
  map('i', '<C-v>', '<ESC>l"+Pli') -- Paste (insert mode)
  map('c', '<C-v>', '<C-R>+') -- Paste (command mode)
end

-- VIMTEX Configuration
-- Ensure VimTeX loads correctly
-- vim.cmd("filetype plugin indent on")
-- vim.cmd("syntax enable")

-- -- Set PDF viewer
-- vim.g.vimtex_view_method = "zathura"

-- reference: https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
