return {
  'github/copilot.vim',
  -- to setup copilot, run `:Copilot setup`
  -- this spins up a Node server in the background $HOME/.local/share/nvim/lazy/copilot.vim/copilot-language-server/dist/language-server.js --stdio
  event = 'VimEnter',
  init = function()
    vim.g.copilot_no_tab_map = false
    vim.g.copilot_workspace_folder = { vim.fn.getcwd() }
  end,
  keys = {
    { '<A-j>', 'copilot#Accept("\\<CR>")', mode = 'i', expr = true, silent = true, desc = 'Accept Copilot Suggestion' },
    {
      '<leader>cop',
      '<cmd>Copilot disable<CR>',
      mode = 'n',
      silent = true,
      desc = 'Disable copilot for current buffer',
    },
  },
}
