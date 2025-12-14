return {
  'ibhagwan/fzf-lua',
  event = 'VeryLazy',
  -- https://github.com/LazyVim/LazyVim/discussions/5221#discussioncomment-11641390
  -- opts = {
  -- },
  config = function()
    local actions = require('fzf-lua').actions
    -- Helper function to create horizontal layout
    local function with_horizontal_layout(fzf_func, opts)
      return function()
        local config = vim.tbl_deep_extend('force', opts or {}, {
          winopts = {
            fullscreen = true,
            preview = {
              layout = 'horizontal',
              horizontal = 'down:60%',
              scrollbar = 'float',
              scrolloff = '-4',
            },
            border = 'rounded',
          },
        })
        fzf_func(config)
      end
    end
    local opts = {
      file_ignore_patterns = {
        'node-modules/',
        'go/',
        'Android/',
        '.local/share/',
        '.local/state/',
        '.vscode/',
        '.config/Code/',
        '.Trash-1000/',
        '.git/',
        '.cargo/',
        '.rustup/',
        '.cache/',
        '.mozilla/',
        '.npm/',
        '.bun/',
        '.terrascan/',
        '.bundle/',
        '.gradle/',
        '.pub-cache/',
        '.config/libreoffice/',
        '.flutter-devtools/',
        '.claude/',
        '.dart-tool/',
        '.dotnet/',
        '.opencode/',
        '.kube/',
        '.dartServer/',
        '.keychain/',
        '.java/',
        '.password-store/',
        '.android/',
        '.gemini/',
        '.vagrant.d/',
        '.config/',
        '.zen/',
        '.tmux/',
        '.ansible/',
        '.docker/',
        '.gnupg/',
        '.logseq/',
        '.nix-defexpr/',
        '.nix-defexpr/channels/',
        '.nix-defexpr/channels_root/',
      },

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
        fullscreen = true,
        preview = {
          vertical = 'right:60%', -- show preview on the right, take 60% of space
          layout = 'vertical',
          scrollbar = 'float',
          scrolloff = '-4',
        },
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
    -- Configure colors for the picker
    vim.api.nvim_set_hl(0, 'FzfLuaBorder', { fg = '#54546D' })
    vim.api.nvim_set_hl(0, 'FzfLuaDirPart', { fg = '#8DA2C2', italic = true })
    vim.api.nvim_set_hl(0, 'FzfLuaFilePart', { fg = '#7CB879', bold = true })

    local fzf = require 'fzf-lua'
    fzf.register_ui_select()
    fzf.setup(opts)

    local bind_opts = { noremap = true, silent = true }

    local bind = function(keys, func, desc, mode)
      vim.keymap.set(mode or 'n', keys, func, vim.tbl_extend('force', bind_opts, { desc = desc }))
    end

    bind('<leader>fzf', fzf.builtin, 'fzf ❤️')
    bind('<leader>ff', fzf.resume, 'Resume Previous fzf Search')
    bind('<A-f>', fzf.files, 'Find Files')
    bind('<leader>F', function()
      fzf.files {
        cwd = vim.fn.expand '%:h',
        -- This command uses a regex to find only files in the top-level
        -- directory, which solves both the recursion and './' prefix issues.
        cmd = 'fd --type f --hidden --max-depth 2',
      }
    end, 'Find Files (Buffer Dir, Non-Recursive)')
    bind('<leader>f/', function()
      fzf.files { cwd = '/' }
    end, 'Search root / directory')
    bind('<leader>fh', function()
      fzf.files { cwd = os.getenv 'home', hidden = true }
    end, 'Search $HOME directory')
    bind('<leader>fm', function()
      fzf.files { cwd = '$HOME/notes' }
    end, 'Search $HOME/notes directory')
    bind('<leader>fn', function()
      fzf.files { cwd = vim.fn.stdpath 'config' }
    end, 'Search $HOME/.config/nvim directory')

    -- Grep
    bind('<A-g>', with_horizontal_layout(fzf.live_grep), 'Grep')
    bind('<leader>fM', function()
      fzf.live_grep_native { cwd = '$HOME/notes' }
    end, 'Grep Notes')
    bind('<A-/>', fzf.blines, 'Buffer Lines')
    bind('<leader>gw', fzf.grep_cword, 'Grep Word')
    bind('<leader>fc', fzf.grep_cword, 'Grep Word (Alt)')
    bind('<leader>fg.', fzf.grep_cWORD, 'Grep WORD')
    bind('<leader>ft', '<cmd>TodoFzfLua<CR>', 'Search TODOs')

    -- Buffers / Recents
    bind('<leader><leader>', fzf.buffers, 'Buffers')
    bind('<leader>f,', fzf.oldfiles, 'Recent Files')

    -- Git
    bind('<leader>gca', fzf.git_commits, 'Git Commits')
    bind('<leader>gh', fzf.git_bcommits, 'Git Buffer Commits')

    -- Misc
    bind('<leader>K', with_horizontal_layout(fzf.keymaps), 'Keymaps')
    bind('<leader>fd', with_horizontal_layout(fzf.diagnostics_document), 'Document Diagnostics')
    bind('<leader>fD', with_horizontal_layout(fzf.diagnostics_workspace), 'Workspace Diagnostics')
    bind('<leader>fq', with_horizontal_layout(fzf.quickfix), 'Quickfix List')
    bind('<leader>H', with_horizontal_layout(fzf.help_tags), 'Help Tags')
    bind('<leader>mar', fzf.marks, 'Marks')
    bind('<leader>e', fzf.zoxide, 'Zoxide')
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
    -- https://theopark.me/blog/2025-04-23-fzf-lua-parent-dir/#solution
    -- WARNING: your bind variable won't work for this keybind. so use vim.keymap.set
    vim.keymap.set('n', '<leader>f.', function()
      -- Fill the table with parent directories
      local dirs = {}

      for dir in vim.fs.parents(vim.uv.cwd()) do
        table.insert(dirs, dir)
      end

      -- Open a custom fzf to select a directory and launch fzf-files

      require('fzf-lua').fzf_exec(dirs, {

        prompt = 'Parent Directories❯ ',

        actions = {

          ['default'] = function(selected)
            require('fzf-lua').files { cwd = selected[1] }
          end,
        },
      })
    end, { desc = '[S]earch Parent Directories [..]' })
  end,
}
