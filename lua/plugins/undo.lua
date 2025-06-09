return {
  'mbbill/undotree',
  keys = {
    {
      '<leader>u',
      '<cmd>UndotreeToggle<CR>',
      desc = 'Toggle UndoTree',
    },
    -- {
    --   "<leader>U",
    --   function()
    --     vim.cmd("UndotreeShow")
    --     vim.cmd("UndotreeFocus")
    --   end,
    --   desc = "Show and focus UndoTree",
    -- },
  },
  init = function()
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_WindowLayout = 2 -- [2] = tree on left, diff on right
    vim.g.undotree_SplitWidth = 40 -- Width of the undotree split
    vim.g.undotree_DiffAutoOpen = 1 -- Auto open diff panel
    vim.g.undotree_HelpLine = 0 -- Disable help line at bottom
  end,
  cmd = { 'UndotreeToggle', 'UndotreeShow', 'UndotreeHide', 'UndotreeFocus' },
}
