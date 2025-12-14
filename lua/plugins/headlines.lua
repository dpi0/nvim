return {
  'lukas-reineke/headlines.nvim',
  ft = 'markdown',
  opts = {
    markdown = {
      headline_highlights = { 'Headline1', 'Headline2', 'Headline3', 'Headline4', 'Headline5', 'Headline6' },
    },
  },
  config = function(_, opts)
    require('headlines').setup(opts)

    local colors = {
      { fg = '#FF6C6B', bg = '#2A1C1C' }, -- red
      { fg = '#98BE65', bg = '#1F2A1C' }, -- green
      { fg = '#ECBE7B', bg = '#2A251C' }, -- yellow
      { fg = '#37AEFF', bg = '#1C2430' }, -- blue
      { fg = '#C678DD', bg = '#2A1C2A' }, -- purple
      { fg = '#46D9FF', bg = '#1A2A2F' }, -- cyan
    }

    for i, c in ipairs(colors) do
      vim.api.nvim_set_hl(0, 'Headline' .. i, {
        fg = c.fg,
        bg = c.bg,
        bold = true,
      })
    end

    -- Code block background
    vim.api.nvim_set_hl(0, 'CodeBlock', {
      bg = '#0a0a0a',
    })

    vim.api.nvim_set_hl(0, 'CodeBlockBorder', {
      fg = '#0a0a0a',
    })
  end,
}
