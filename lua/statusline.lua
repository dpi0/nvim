local M = {}

function M.git_branch()
  local branch = vim.fn.system "git branch --show-current 2>/dev/null | tr -d '\n'"
  return branch ~= '' and ' ' .. branch or ''
end

function M.lsp_diagnostics()
  local bufnr = vim.api.nvim_get_current_buf()

  local errors = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.ERROR })
  local warnings = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.WARN })
  local hints = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.HINT })
  local info = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.INFO })

  local parts = {}

  if errors > 0 then
    table.insert(parts, '%#DiagnosticError# ' .. errors .. '%*')
  end
  if warnings > 0 then
    table.insert(parts, '%#DiagnosticWarn# ' .. warnings .. '%*')
  end
  if info > 0 then
    table.insert(parts, '%#DiagnosticInfo# ' .. info .. '%*')
  end
  if hints > 0 then
    table.insert(parts, '%#DiagnosticHint# ' .. hints .. '%*')
  end

  -- If nothing to show, display green dot
  if #parts == 0 then
    return '%#DiagnosticOk#●%*'
  end

  return table.concat(parts, ' ')
end

local statusline = {
  '%r',
  '%{%v:lua.require("statusline").git_branch()%}',
  '%m',
  '%=',
  '%F',
  '  ',
  '%{%v:lua.require("statusline").lsp_diagnostics()%}',
  '  ',
  '󰘡 %L',
  '  ',
  ' %3l:%-2c ',
}

vim.o.statusline = table.concat(statusline, '')

return M
