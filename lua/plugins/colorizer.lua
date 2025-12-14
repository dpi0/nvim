return {
  'catgoose/nvim-colorizer.lua',
  event = 'BufReadPre',
  opts = {
    -- https://github.com/catgoose/nvim-colorizer.lua#customization
    user_default_options = {
      css = true, -- Enable all CSS *features*:
      css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn, oklch_fn
      tailwind = true, -- Enable tailwind colors
      xterm = false, -- Enable xterm 256-color codes (#xNN, \e[38;5;NNNm)
      mode = 'background', -- Set the display mode
      virtualtext = '■',
      virtualtext_inline = false,
      virtualtext_mode = 'foreground',
    },
  },
}
