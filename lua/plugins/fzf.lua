return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  config = function()
    local actions = require('fzf-lua').actions
    local opts = {
      previewers = {
        builtin = {
          syntax_limit_b = 1024 * 100,
        },
      },
      hls = {
        match = 'FzfLuaFzfMatch',
      },
      fzf_opts = {
        ['--cycle'] = true,
      },
      winopts = {
        -- height = 1, -- height
        -- width = 1, -- width
        -- row = 0, -- window row position (0=top, 1=bottom)
        -- col = 0, -- window col position (0=left, 1=right)
        fullscreen = true,
        preview = {
          vertical = 'down:60%', -- show preview at bottom, take 60% of space
          layout = 'vertical',
          scrollbar = 'float',
          scrolloff = '-4',
        },
        -- backdrop = 60, -- Backdrop opacity, 0 is fully opaque, 100 is fully transparent (i.e. disabled)
        border = 'rounded',
      },
      grep = {
        rg_glob = true,
        glob_flag = '--iglob',
        glob_separator = '%s%-%-',
        cmd = 'rg --line-number --column --no-heading --color=always',
        rg_opts = table.concat({
          '--hidden',
          '--no-ignore-vcs',
          '--glob=!**/.local/**',
          '--glob=!**/.rustup/**',
          '--glob=!**/node_modules/**',
          '--glob=!**/.cargo/**',
          '--glob=!**/.continue/**',
          '--glob=!**/.mozilla/**',
          '--glob=!**/go/pkg/mod/**',
          '--glob=!**/Code/User/**',
          '--glob=!**/.git/**',
          '--glob=!**/.npm/**',
          '--glob=!**/.cache/**',
        }, ' '),
      },
      files = {
        cmd = table.concat({
          'fd --type f --hidden --follow',
          '--exclude .git',
          '--exclude node_modules',
          '--exclude .cargo',
          '--exclude .mozilla',
          '--exclude .cache',
          '--exclude .npm',
          '--exclude .rustup',
          '--exclude .dotnet',
          '--exclude go/pkg/mod',
          '--exclude Code/User',
          '--exclude .local',
          '--exclude .continue',
        }, ' '),
        formatter = 'path.dirname_first',
        -- formatter = 'path.filename_first',
        cwd_prompt_shorten_len = 50, -- shorten prompt beyond this length
        cwd_prompt_shorten_val = 3, -- shortened path parts length       cwd_prompt_shorten_len = 50,
      },
      defaults = {
        git_icons = true,
        file_icons = true,
        color_icons = true,
      },
      keymap = {
        builtin = {
          true,
          ['<C-d>'] = 'preview-page-down',
          ['<C-u>'] = 'preview-page-up',
        },
        fzf = {
          true,
          ['ctrl-d'] = 'preview-page-down',
          ['ctrl-u'] = 'preview-page-up',
          ['ctrl-q'] = 'select-all+accept',
        },
      },
      actions = {
        files = {
          ['enter'] = actions.file_edit_or_qf,
          ['ctrl-x'] = actions.file_split,
          ['ctrl-v'] = actions.file_vsplit,
          ['ctrl-t'] = actions.file_tabedit,
          ['alt-q'] = actions.file_sel_to_qf,
        },
      },
    }

    -- https://github.com/ibhagwan/fzf-lua?tab=readme-ov-file#highlight-groups
    vim.api.nvim_set_hl(0, 'FzfLuaBorder', { fg = '#54546D' })
    vim.api.nvim_set_hl(0, 'FzfLuaDirPart', { fg = '#8DA2C2', italic = true })
    vim.api.nvim_set_hl(0, 'FzfLuaFilePart', { fg = '#90C98E', bold = true })

    local fzf = require 'fzf-lua'
    fzf.register_ui_select()
    fzf.setup(opts)

    local bind_opts = { noremap = true, silent = true }

    local bind = function(keys, func, desc, mode)
      vim.keymap.set(mode or 'n', keys, func, vim.tbl_extend('force', bind_opts, { desc = desc }))
    end

    bind('<leader>fzf', fzf.builtin, 'fzf ❤️')
    bind('<leader>ff', fzf.resume, 'Resume Previous fzf Search')

    -- Files
    bind('<A-f>', fzf.files, 'Find Files')
    bind('<leader>f/', function()
      fzf.files { cwd = '/' }
    end, 'Search root / directory')
    bind('<leader>fh', function()
      fzf.files { cwd = os.getenv 'HOME', hidden = true }
    end, 'Search $HOME directory')
    bind('<leader>fm', function()
      fzf.files { cwd = '$HOME/notes' }
    end, 'Search $HOME/notes directory')
    bind('<leader>fn', function()
      fzf.files { cwd = vim.fn.stdpath 'config' }
    end, 'Search $HOME/.config/nvim directory')

    -- Grep
    bind('<A-g>', fzf.live_grep, 'Grep')
    bind('<leader>fM', function()
      fzf.live_grep_native { cwd = '$HOME/notes' }
    end, 'Grep Notes')
    bind('<A-/>', fzf.blines, 'Buffer Lines')
    bind('<leader>gw', fzf.grep_cword, 'Grep Word')
    bind('<leader>fc', fzf.grep_cword, 'Grep Word (Alt)')
    bind('<A-S-f>', fzf.grep_cWORD, 'Grep WORD')
    bind('<leader>ft', '<cmd>TodoFzfLua<CR>', 'Search TODOs')

    -- Buffers / Recents
    bind('<leader><leader>', fzf.buffers, 'Buffers')
    bind('<leader>f,', fzf.oldfiles, 'Recent Files')

    -- Git
    bind('<leader>gca', fzf.git_commits, 'Git Commits')
    bind('<leader>gH', fzf.git_bcommits, 'Git Buffer Commits')

    -- Misc
    bind('<leader>K', fzf.keymaps, 'Keymaps')
    bind('<leader>fd', fzf.diagnostics_document, 'Document Diagnostics')
    bind('<leader>fD', fzf.diagnostics_workspace, 'Workspace Diagnostics')
    bind('<leader>fq', fzf.quickfix, 'Quickfix List')
    bind('<leader>H', fzf.help_tags, 'Help Tags')
    bind('<leader>mar', fzf.marks, 'Marks')
    bind('<leader>o', fzf.zoxide, 'Zoxide')
    bind('<leader>fs', function()
      fzf.spell_suggest {
        winopts = {
          height = 0.4,
          width = 0.5,
          row = 1, -- relative to cursor
          col = 0,
          relative = 'cursor',
          preview = { hidden = 'hidden' },
        },
      }
    end, 'Spelling Suggest (Cursor)')
  end,
}
