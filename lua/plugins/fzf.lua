return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  config = function()
    local fzf = require 'fzf-lua'
    -- local actions = require('fzf-lua').actions
    fzf.register_ui_select()
    fzf.setup {
      keymap = {
        builtin = {
          ['<C-d>'] = 'preview-page-down',
          ['<C-u>'] = 'preview-page-up',
        },
      },
    }
  end,
  opts = {
    previewers = {
      builtin = {
        syntax_limit_b = 1024 * 100, -- 100KB limit on previews
      },
    },
    fzf_opts = { ['--cycle'] = true },
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
    },
    defaults = {
      git_icons = true,
      file_icons = true,
      color_icons = true,
    },
  },
  keys = (function()
    -- Common window configurations
    local win_configs = {
      large = {
        height = 0.9,
        width = 0.9,
        row = 0.5,
        col = 0.5,
        anchor = 'center',
        preview = {
          layout = 'horizontal',
          horizontal = 'right:50%',
        },
      },
      vertical = {
        height = 0.9,
        width = 0.8,
        row = 0.5,
        col = 0.5,
        anchor = 'center',
        preview = {
          layout = 'vertical',
          vertical = 'up:50%',
        },
      },
      fullscreen = {
        width = 1.0,
        height = 1.0,
        row = 0.0,
        col = 0.0,
        anchor = 'NW',
      },
      cursor = {
        relative = 'cursor',
        row = 1.01,
        col = 0,
        width = 0.2,
        height = 0.2,
      },
    }

    -- Helper function to create file finder with custom options
    local function files_with_opts(opts)
      return function()
        require('fzf-lua').files(opts or {})
      end
    end

    -- Helper function to create grep with custom options
    local function grep_with_opts(opts)
      return function()
        require('fzf-lua').live_grep(opts or {})
      end
    end

    return {
      -- Core fuzzy finder
      {
        '<leader>fzf',
        function()
          require('fzf-lua').builtin()
        end,
        desc = 'FzfLua ❤️',
      },
      {
        '<leader>ff',
        function()
          require('fzf-lua').resume()
        end,
        desc = 'Resume last fzf-lua window',
      },

      -- File finders
      { '<A-f>', files_with_opts { winopts = win_configs.large }, desc = 'Fuzzy find files in cwd' },
      { '<leader>f/', files_with_opts { cwd = '/', hidden = true }, desc = 'Find files in /root' },
      {
        '<leader>fh',
        files_with_opts { cwd = os.getenv 'HOME', hidden = true, winopts = win_configs.large },
        desc = 'Find files in $HOME',
      },
      { '<leader>fm', files_with_opts { cwd = '$HOME/notes' }, desc = 'Find files in $HOME/notes' },
      {
        '<leader>fn',
        files_with_opts { cwd = vim.fn.stdpath 'config', winopts = win_configs.large },
        desc = 'Find files in Neovim config',
      },

      -- Grep/search
      {
        '<A-g>',
        grep_with_opts {
          winopts = vim.tbl_extend('force', win_configs.vertical, { fzf_opts = { ['--layout'] = 'reverse' } }),
          glob_flag = '--iglob',
        },
        desc = 'Grep',
      },
      {
        '<leader>fM',
        function()
          require('fzf-lua').live_grep_native { cwd = '$HOME/notes' }
        end,
        desc = 'Grep in $HOME/notes',
      },
      {
        '<A-/>',
        function()
          require('fzf-lua').blines {
            winopts = vim.tbl_extend('force', win_configs.vertical, { fzf_opts = { ['--layout'] = 'reverse' } }),
          }
        end,
        desc = 'Fuzzy search in current buffer',
      },
      {
        '<leader>gw',
        function()
          require('fzf-lua').grep_cword()
        end,
        desc = 'Find string in cwd',
      },
      {
        '<leader>fc',
        function()
          require('fzf-lua').grep_cword()
        end,
        desc = 'Find string under cursor in cwd',
      },
      {
        '<A-S-f>',
        function()
          require('fzf-lua').grep_cWORD()
        end,
        desc = 'Find string under cursor in cwd',
      },
      {
        '<leader>ft',
        function()
          require('fzf-lua').grep { cmd = 'rg --column --line-number', search = 'TODO', prompt = 'Todos> ' }
        end,
        desc = 'Find TODOs',
      },

      -- Buffers and recent files
      {
        '<leader><leader>',
        function()
          require('fzf-lua').buffers { winopts = win_configs.large }
        end,
        desc = 'Find existing buffers',
      },
      {
        '<leader>f,',
        function()
          require('fzf-lua').oldfiles()
        end,
        desc = 'Fuzzy find recent files',
      },
      {
        '<leader>ro',
        function()
          require('fzf-lua').oldfiles { winopts = win_configs.large }
        end,
        desc = 'Recent Files',
      },

      -- Git
      {
        '<leader>gca',
        function()
          require('fzf-lua').git_commits { winopts = win_configs.fullscreen }
        end,
        desc = 'Search Git Commits for cwd',
      },
      {
        '<leader>gH',
        function()
          require('fzf-lua').git_bcommits { winopts = win_configs.fullscreen }
        end,
        desc = 'Search Git Commits for Current File Only',
      },

      -- Utilities
      {
        '<leader>K',
        function()
          require('fzf-lua').keymaps()
        end,
        desc = 'Check keymap availability',
      },
      {
        '<leader>ce',
        function()
          require('fzf-lua').colorschemes()
        end,
        desc = 'Preview Colorschemes',
      },
      {
        '<leader>fd',
        function()
          require('fzf-lua').diagnostics_workspace { winopts = win_configs.fullscreen }
        end,
        desc = 'Search Diagnostics',
      },
      {
        '<leader>fq',
        function()
          require('fzf-lua').quickfix()
        end,
        desc = 'Show quick fix list',
      },
      {
        '<leader>fH',
        function()
          require('fzf-lua').help_tags {
            winopts = vim.tbl_extend(
              'force',
              win_configs.fullscreen,
              { preview = { layout = 'vertical', vertical = 'up:80%' } }
            ),
          }
        end,
        desc = 'Search Help (Fullscreen)',
      },
      {
        '<leader>mar',
        function()
          require('fzf-lua').marks { fzf_opts = { ['--query'] = '^' } }
        end,
        desc = 'Marks',
      },
      {
        '<leader>o',
        function()
          require('fzf-lua').zoxide { winopts = win_configs.fullscreen }
        end,
        desc = 'Zoxide switch b/w cwd',
      },

      -- Spelling and code actions
      {
        '<leader>fs',
        function()
          require('fzf-lua').spell_suggest { winopts = win_configs.cursor }
        end,
        desc = 'Spelling suggestions (Overriden default z=)',
      },
      {
        '<leader>ca',
        function()
          require('fzf-lua').lsp_code_actions {
            winopts = { relative = 'cursor', width = 0.6, height = 0.6, row = 1, preview = { vertical = 'up:70%' } },
          }
        end,
        desc = 'Code actions',
      },
    }
  end)(),
}
