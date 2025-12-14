return {
  'neovim/nvim-lspconfig', -- INFO: Provides the LSP configurations present in <https://github.com/neovim/nvim-lspconfig/tree/master/lsp>
  event = { 'InsertEnter', 'VeryLazy' },
  dependencies = {
    { 'mason-org/mason.nvim', event = 'VeryLazy', opts = {} }, -- INFO: Plugin manager for LSP, Formatterm, Linter and other tools
    {
      'mason-org/mason-lspconfig.nvim', -- INFO: 1. Auto install LSP servers only 2. Auto enable them (don't have to use vim.lsp.enable())
      event = 'VeryLazy',
      opts = {
        automatic_enable = true, -- Auto enables the language servers
        -- Using mason-tool-installer to install the Language Servers
      },
    },
    {
      'WhoIsSethDaniel/mason-tool-installer.nvim', -- INFO: Install Language Servers, Linters and Formatters via Mason
      event = 'VeryLazy',
      opts = {
        run_on_start = false, -- When false, install manually using :MasonToolsInstall
        auto_update = false,
        ensure_installed = {
          -- Language Servers
          'docker-language-server', -- These servers are auto enabled by mason-lspconfig (otherwise manually do vim.lsp.enable)
          'dockerfile-language-server',
          'docker_compose_language_service',
          'yamlls',
          -- 'lua_ls',
          'ansiblels',
          -- 'gopls',
          'bashls',
          -- Formatters
          'yamlfmt',
          'shfmt', -- Shell
          'stylua',
          'prettierd', -- General
          'taplo', -- TOML
          'rumdl', -- Markdown (Linter as well)
          -- Linters
          'yamllint',
          'shellcheck',
          'selene', -- Lua
          'djlint', -- HTML
          'ruff', -- Python
        },
      },
    },
  },
  config = function()
    vim.diagnostic.config {
      virtual_text = false, -- NOTE: rachartier/tiny-inline-diagnostic.nvim now handles the inline messages
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      } or {}, -- show signs in the gutter
    }
    -- NOTE: Using the keys = {} from lazy made LSP only trigger when these binds were hit
    vim.keymap.set('n', '<leader>M', '<cmd>Mason<CR>', { desc = 'Mason ⚙️' })
    vim.keymap.set('n', '<leader>lsp', '<cmd>checkhealth vim.lsp<CR>', { desc = 'Checkhealth LSP' })

    -- MANUALLY ADDING LANGUAGE SERVERS
    vim.lsp.enable { 'lua_ls' } -- NOTE: Had to do lua_ls manually as Mason's "lua-language-server" was using an outdated library "libbfd-2.38-system.so"
  end,
}
