return {
  -- https://github.com/jakobwesthoff/nvim-from-scratch/blob/session/04/lua/plugins/lsp.lua#L11
  'neovim/nvim-lspconfig',
  event = 'VeryLazy', -- CAUTION: when using VeryLazy event, mason-tool-installer will not automatically install your tools on launch
  -- event = 'BufEnter',
  -- WARNING: for some reason currently LSP seems to only be active when neovim is launched with `nvim .`
  -- `nvim FILENAME` doesn't trigger LSP for current session, checked with `:LspInfo`
  dependencies = {
    { 'williamboman/mason.nvim', event = 'VeryLazy', opts = {} },
    { 'williamboman/mason-lspconfig.nvim', event = 'VeryLazy' },
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
  },
  keys = {
    {
      '<leader>M',
      function()
        vim.cmd 'Mason'
      end,
      desc = 'Mason ⚙️',
    },
    {
      '<leader>lsp',
      function()
        vim.cmd 'LspInfo'
      end,
      desc = 'LSP Info for current buffer',
    },
  },
  config = function()
    local mason_tool_installer = require 'mason-tool-installer'
    local mason_lspconfig = require 'mason-lspconfig'
    local fzf = require 'fzf-lua'

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local bind = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
        end

        -- NOTE: these fzf.X binds are for buffer = event.buf
        -- buffer = event.buf ensures the keymap is only active in the buffer where the LSP client just attached
        -- Removing it means the keymaps are created globally (even when LSP is not attached)
        bind('<leader>ca', vim.lsp.buf.code_action, 'LSP: Code Actions (Normal/Visual)', { 'n', 'x' })
        bind('gdd', fzf.lsp_definitions, 'LSP: Go to Definition')
        bind('gds', fzf.lsp_document_symbols, 'LSP: Document Symbol Outline')
        bind('gD', vim.lsp.buf.declaration, 'LSP: Go to Declaration') -- rarely used
        bind('grr', fzf.lsp_references, 'LSP: Find References')
        bind('grn', vim.lsp.buf.rename, 'LSP: Rename Symbol')
        bind('gri', fzf.lsp_implementations, 'LSP: Go to Implementation')
        bind('grd', fzf.lsp_typedefs, 'LSP: Go to Type Definition')
        -- bind('<leader>ws', fzf.lsp_live_workspace_symbols, 'LSP: Live Workspace Symbol Search')

        -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
        ---@param client vim.lsp.Client
        ---@param method vim.lsp.protocol.Method
        ---@param bufnr? integer some lsp support methods only in specific files
        ---@return boolean
        local function client_supports_method(client, method, bufnr)
          if vim.fn.has 'nvim-0.11' == 1 then
            return client:supports_method(method, bufnr)
          else
            return client.supports_method(method, { bufnr = bufnr })
          end
        end

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if
          client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
        then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        -- The following code creates a keymap to toggle inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- This may be unwanted, since they displace some of your code
        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          bind('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    -- Diagnostic Config
    -- See :help vim.diagnostic.Opts
    vim.diagnostic.config {
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      },
      virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
          local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
          }
          return diagnostic_message[diagnostic.severity]
        end,
      },
    }

    -- LSP servers and clients are able to communicate to each other what features they support.
    --  By default, Neovim doesn't support everything that is in the LSP specification.
    --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
    --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
    -- explanation for capabilities: https://youtu.be/GKIxgCcKAq4
    local original_capabilities = vim.lsp.protocol.make_client_capabilities()
    local capabilities = require('blink.cmp').get_lsp_capabilities(original_capabilities)
    local servers = {
      -- INFO: find the list of servers with :Mason or <leader>M
      -- then hit C-f
      -- and your language like 'go'
      -- it'll will filter out all LSPs for that lang

      -- find the list of all servers from
      -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
      bashls = {},
      gopls = {},
      basedpyright = {},
      dockerls = {},
      ansiblels = {},
      yamlls = {
        schemas = {
          -- kubernetes = 'k8s-*.yaml', -- only activate this schema if the file name has this format
          kubernetes = '*.yml', -- only activate this schema if the file name has this format
          ['http://json.schemastore.org/github-workflow'] = '.github/workflows/*',
          ['http://json.schemastore.org/github-action'] = '.github/action.{yml,yaml}',
          ['http://json.schemastore.org/ansible-stable-2.9'] = 'roles/tasks/**/*.{yml,yaml}',
          ['http://json.schemastore.org/prettierrc'] = '.prettierrc.{yml,yaml}',
          ['http://json.schemastore.org/kustomization'] = 'kustomization.{yml,yaml}',
          ['http://json.schemastore.org/chart'] = 'Chart.{yml,yaml}',
          ['http://json.schemastore.org/circleciconfig'] = '.circleci/**/*.{yml,yaml}',
        },
      },
      terraformls = {},
      docker_compose_language_service = {},
      jsonls = {},
      taplo = {},
      marksman = {},
      nil_ls = {},
      -- vale_ls = {}, -- for strict writing https://vale.sh/docs/vale-ini

      lua_ls = {
        -- cmd = { ... },
        -- filetypes = { ... },
        -- capabilities = {},
        -- settings = {
        --   Lua = {
        --     completion = {
        --       callSnippet = 'Replace',
        --     },
        --     -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        --     -- diagnostics = { disable = { 'missing-fields' } },
        --   },
        -- },
      },
    }

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      -- NOTE: uses mason-tool-installer to install tools other than LSPs to be present
      -- mason-tool-installer just uses Mason to get the packages
      -- again the list of valid package names can be seen using
      -- command :Mason or <leader>M
      -- hit C-f and search for your language
      -- INFO: anything other than LSPs from mason-tool-installer
      --
      -- cAUTION: the event for nvim-lspconfig should be 'BufEnter' for mason-tool-installer to install tools on startup
      -- otherwise if event = 'VeryLazy' is set it doesn't install them on boot automatically

      -- formatters
      -- https://mason-registry.dev/registry/list?search=
      'stylua',
      'prettierd',
      'prettier',
      'goimports',
      'yamlfmt',
      'shfmt',
      'mdformat',
      'cbfmt', -- format code blocks in .md using .cbfmt.toml file
      -- 'mdsf', -- same as above
      -- 'terraform_fmt',
      -- 'autocorrect', -- correct spaces, words, and punctuations
      -- 'codespell', -- Check code for common misspellings
      -- 'js-beautify', -- general formatter for html, css and js
      -- 'tex-fmt', -- LaTeX

      -- linters
      'golangci-lint',
      'shellcheck',
      'selene',
      'ansible-lint',
      'ruff',
      'yamllint', -- add a `.yamllint` file at root of project to configure linter's options
      'jsonlint',
      'markdownlint-cli2',
      'djlint', -- HTML linter and formatter
      -- 'vale', -- for text/writing
      -- 'stylelint', -- css linter
    })
    mason_tool_installer.setup { ensure_installed = ensure_installed }

    mason_lspconfig.setup {
      ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
      automatic_installation = false,
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for ts_ls)
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
