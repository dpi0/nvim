return {
  'numToStr/Comment.nvim',
  event = 'VeryLazy',
  opts = {
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
      -- -Line-comment toggle keymap
      line = '<A-c>',
      ---Block-comment toggle keymap
      -- block = '<A-S-c>',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
      ---Line-comment keymap
      line = '<A-c>',
      ---Block-comment keymap
      -- block = '<A-s-c>',
    },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
      ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
      basic = true,
      ---Extra mapping; `gco`, `gcO`, `gcA`
      extra = true,
      -- `gco` - Insert comment to the next line and enters INSERT mode
      -- `gcO` - Insert comment to the previous line and enters INSERT mode
      -- `gcA` - Insert comment to end of the current line and enters INSERT mode
      -- `gcw` - Toggle from the current cursor position to the next word
      -- `gc$` - Toggle from the current cursor position to the end of line
      -- `gc}` - Toggle until the next blank line
      -- `gc5j` - Toggle 5 lines after the current cursor position
      -- `gc8k` - Toggle 8 lines before the current cursor position
      -- `gcip` - Toggle inside of paragraph
      -- `gca}` - Toggle around curly brackets
    },
  },
}
