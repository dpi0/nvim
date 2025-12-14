return {
  'mfussenegger/nvim-lint',
  event = 'BufReadPost',
  config = function()
    local lint = require 'lint'
    -- https://github.com/mfussenegger/nvim-lint#available-linters
    lint.linters_by_ft = {
      python = { 'ruff' },
      go = { 'golangcilint' },
      terraform = { 'tflint' },
      ansible = { 'ansible_lint' },
      bash = { 'shellcheck' },
      sh = { 'shellcheck' },
      zsh = { 'shellcheck' },
      lua = { 'selene' },
      yaml = { 'yamllint' },
      yml = { 'ansible_lint' },
      json = { 'jsonlint' },
      html = { 'djlint' },
      j2 = { 'djlint' },
      nix = { 'nix' },
      ruby = { 'ruby' },
      -- markdown = { 'rumdl' },
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
