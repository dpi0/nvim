return {
  'stevearc/conform.nvim',
  event = 'BufEnter',
  cmd = 'ConformInfo',
  opts = {
    format_on_save = {
      timeout_ms = 2000,
      lsp_format = 'fallback',
    },
    -- Custom formatters
    formatters = {
      rumdl = {
        command = 'rumdl',
        args = { 'fmt', '-' },
        stdin = true,
        env = {
          RUMDL_CACHE_DIR = vim.fn.expand '~/.cache/rumdl',
        },
      },
    },
    -- https://github.com/stevearc/conform.nvim#formatters
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'ruff_organize_imports', 'ruff_fix', 'ruff_format' },
      go = { 'gofmt' },
      yaml = { 'yamlfmt' },
      bash = { 'shfmt' },
      zsh = { 'shfmt' },
      sh = { 'shfmt' },
      json = { 'prettierd' },
      jsonc = { 'prettierd' },
      toml = { 'taplo' },
      -- nix = { 'alejandra' },
      terraform = { 'terraform_fmt' },
      javascript = { 'prettierd' },
      css = { 'prettierd' },
      html = { 'prettierd' },
      dart = { 'dart_format' },
      ['*'] = { 'trim_newlines', 'trim_whitespace' },
      markdown = { 'rumdl' }, -- Custom formatter defined above
    },
  },
}
