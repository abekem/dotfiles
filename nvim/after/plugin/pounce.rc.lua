local status, pounce = pcall(require, "pounce")
if (not status) then return end

local map = vim.keymap.set
map("n", "s", function() pounce.pounce {} end)
map("n", "S", function() pounce.pounce { do_repeat = true } end)
map("x", "s", function() pounce.pounce {} end)
map("o", "gs", function() pounce.pounce {} end)
map("n", "S", function() pounce.pounce { input = { reg = "/" } } end)
