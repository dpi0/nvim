return {
  'echasnovski/mini.statusline',
  version = '*',
  config = function()
    local MiniStatusline = require 'mini.statusline'

    -- Wrap section_mode to return only the first character
    local function short_mode()
      local mode_str, mode_hl = MiniStatusline.section_mode { trunc_width = 100 }
      return mode_str:sub(1, 1), mode_hl
    end

    local active = function()
      local mode, mode_hl = short_mode()
      local git = MiniStatusline.section_git { trunc_width = 40 }
      local diff = MiniStatusline.section_diff { trunc_width = 75 }
      local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75 }
      local lsp = MiniStatusline.section_lsp { trunc_width = 75 }
      local filename = MiniStatusline.section_filename { trunc_width = 140 }
      -- local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
      local location = MiniStatusline.section_location { trunc_width = 75 }
      local search = MiniStatusline.section_searchcount { trunc_width = 75 }

      return MiniStatusline.combine_groups {
        { hl = mode_hl, strings = { mode } },
        { hl = 'MiniStatuslineDevinfo', strings = { git, diff, lsp } },
        '%<',
        { hl = 'MiniStatuslineFilename', strings = { filename, search } },
        '%=',
        { hl = mode_hl, strings = { diagnostics, location } },
      }
    end

    MiniStatusline.setup {
      content = { active = active },
      use_icons = true,
      set_vim_settings = false,
    }
  end,
}
