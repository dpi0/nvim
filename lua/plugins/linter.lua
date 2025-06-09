return {
  'mfussenegger/nvim-lint',
  -- event = {
  --   'BufReadPre',
  --   'BufNewFile',
  -- },
  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = {
      -- list of linters from
      -- https://github.com/mfussenegger/nvim-lint#available-linters
      python = { 'ruff' },
      go = { 'golangcilint' },
      terraform = { 'tflint' },
      ansible = { 'ansible_lint' },
      bash = { 'shellcheck' },
      sh = { 'shellcheck' },
      zsh = { 'shellcheck' },
      lua = { 'selene' },
      yaml = { 'yamllint' },
      json = { 'jsonlint' },
      -- md = { 'markdownlint' },
      -- nix = { 'nix' },
      -- javascript = { 'eslint_d' },
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set('n', '<leader>li', function()
      lint.try_lint()
    end, { desc = 'Trigger linting for current file' })
  end,
}
