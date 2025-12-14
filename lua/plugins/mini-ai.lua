return {
  'echasnovski/mini.ai',
  event = 'VeryLazy',
  version = '*',
  opts = {
    custom_textobjects = {
      c = { -- "c" for codeblock
        { '%f[%S][%z\1-\127]+', '^```.-```$' },
      },
    },
    mappings = {
      around = 'a',
      inside = 'i',
      around_next = 'an',
      inside_next = 'in',
      around_last = 'al',
      inside_last = 'il',
      goto_left = 'g[',
      goto_right = 'g]',
    },
  },
}
