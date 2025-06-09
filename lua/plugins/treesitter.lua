return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPost', 'BufNewFile' },
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  -- run ':Inspect' on any line to see what textobject that is
  -- run ':InspectTree' to see whole tree
  -- treesitter is not just syntax highlighting, it's a way for nvim for understand the code better
  -- with the textobjects it defines for everything in the code'
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
    -- https://github.com/jakobwesthoff/nvim-from-scratch/blob/1b05d7c403a5e7fa526064cf05634aedd4fc2ee9/lua/plugins/nvim-treesitter.lua#L16C1-L24C15
    -- select text objects using Enter and unselect using Backspace
    -- super useful!
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<Enter>', -- set to `false` to disable one of the mappings
        node_incremental = '<Enter>',
        scope_incremental = false,
        node_decremental = '<Backspace>',
      },
    },
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
