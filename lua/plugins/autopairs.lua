return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function(_, opts)
    local npairs = require 'nvim-autopairs'
    npairs.setup(opts)

    local Rule = require 'nvim-autopairs.rule'
    npairs.add_rule(Rule('<', '>'))
  end,
}
