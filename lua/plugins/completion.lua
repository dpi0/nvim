return {
  'saghen/blink.cmp',
  event = 'InsertEnter',
  version = '1.*',
  dependencies = {
    'rafamadriz/friendly-snippets',
    -- 'echasnovski/mini.snippets',
  },
  opts = {
    keymap = {
      preset = 'default',
      ['<Enter>'] = { 'accept', 'fallback' },
      ['<A-j>'] = { 'accept', 'fallback' },
    },

    appearance = {
      nerd_font_variant = 'mono',
    },

    completion = { documentation = { auto_show = true } },
    signature = { enabled = true },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },
  opts_extend = { 'sources.default' },
}
