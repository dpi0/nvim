return {
  'nvim-treesitter/nvim-treesitter',
  -- dependencies = {
    -- "nvim-treesitter/nvim-treesitter-textobjects",
  -- },
  event = { "BufReadPost", "BufNewFile" },
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  opts = {
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
    ensure_installed = {
      'vim',
      'vimdoc',
      'lua',
      'luadoc',
      'python',
      'javascript',
      'typescript',
      'regex',
      'terraform',
      'sql',
      'dockerfile',
      'toml',
      'json',
      'java',
      'groovy',
      'go',
      'gitignore',
      'graphql',
      'yaml',
      'make',
      'cmake',
      'query',
      'markdown',
      'markdown_inline',
      'bash',
      'diff',
      'tsx',
      'css',
      'html',
    },
  },
}
