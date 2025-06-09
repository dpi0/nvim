return {
  -- {
  --   'xiyaowong/transparent.nvim',
  --   lazy = false,
  -- },
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        compile = false,
        transparent = true,
        colors = {
          palette = { fujiGray = '#62867F' },
          -- Remove the background of LineNr, {Sign,Fold}Column and friends
          -- https://github.com/rebelot/kanagawa.nvim?tab=readme-ov-file#remove-gutter-background
          theme = {
            all = {
              ui = {
                bg_gutter = 'none',
              },
            },
          },
        },
        -- https://github.com/rebelot/kanagawa.nvim?tab=readme-ov-file#transparent-floating-windows
        overrides = function(colors)
          local theme = colors.theme
          local makeDiagnosticColor = function(color)
            local c = require 'kanagawa.lib.color'
            return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
          end

          return {
            NormalFloat = { bg = 'none' },
            FloatBorder = { bg = 'none' },
            FloatTitle = { bg = 'none' },
            NormalDark = { bg = 'none', fg = theme.ui.fg_dim },
            -- add bg to only Lazy UI
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = 'none', fg = theme.ui.fg_dim },

            -- https://github.com/rebelot/kanagawa.nvim#dark-completion-popup-menu
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },

            -- https://github.com/rebelot/kanagawa.nvim#tint-background-of-diagnostic-messages-with-their-foreground-color
            DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
            DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
            DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
            DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
          }
        end,
      }
      -- https://github.com/jakobwesthoff/nvim-from-scratch/blob/series/01/lua/plugins/kanagawa.lua
      -- keep the vim.cmd at the bottom
      vim.cmd("colorscheme kanagawa-wave");
    end,
  },
}
