if vim.g.vscode then return end
local M = {}

local function set_indent(tab_length, is_hard_tab)
  if is_hard_tab then
    vim.bo.expandtab = false
  else
    vim.bo.expandtab = true
  end

  vim.bo.shiftwidth  = tab_length
  vim.bo.softtabstop = tab_length
  vim.bo.tabstop     = tab_length
end

M.help = function()
  vim.api.nvim_buf_set_keymap(0, 'n', 'q', 'ZZ', { noremap = true })
end

M.java = function()
  set_indent(4, false)
end

M.lua = function()
  set_indent(2, false)
end

M.html = function()
  set_indent(4, false)
end

return setmetatable(M, {
  __index = function()
    return function()
      print('Unexpected filetype!')
      set_indent(2, false)
    end
  end
})
