local status1, hlslens = pcall(require, "hlslens")
if (not status1) then return end
local status2, lastarisk = pcall(require, "lasterisk")
if (not status2) then return end

hlslens.setup()
local kopts = { noremap = true, silent = true }

vim.keymap.set("n", "n", function()
  pcall(vim.cmd, "normal! " .. vim.v.count1 .. "n")
  require("hlslens").start()
end, kopts)
vim.keymap.set("n", "N", function()
  pcall(vim.cmd, "normal! " .. vim.v.count1 .. "N")
  require("hlslens").start()
end, kopts)

vim.keymap.set({ "n", "x" }, "*", function()
  require("lasterisk").search({ is_whole = false })
  require("hlslens").start()
end, {})
vim.keymap.set({ "n", "x" }, "g*", function()
  require("lasterisk").search()
  require("hlslens").start()
end, {})
-- vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
-- vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
