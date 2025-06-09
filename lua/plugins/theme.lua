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
      vim.cmd [[colorscheme kanagawa-wave]]

      require('kanagawa').setup {
        compile = false,
        transparent = true,
        colors = {
          palette = { fujiGray = '#62867F' },
          -- theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
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

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            -- NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            NormalDark = { fg = theme.ui.fg_dim, bg = 'none' },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            -- LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            LazyNormal = { bg = 'none', fg = theme.ui.fg_dim },
            -- MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = 'none', fg = theme.ui.fg_dim },

            -- https://github.com/rebelot/kanagawa.nvim#dark-completion-popup-menu
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },

        --     -- https://github.com/rebelot/kanagawa.nvim#tint-background-of-diagnostic-messages-with-their-foreground-color
            DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
            DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
            DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
            DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
          }
        end,
      }
    end,
  },
}
