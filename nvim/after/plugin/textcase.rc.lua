local status, textcase = pcall(require, "textcase")
if (not status) then return end

textcase.setup({})

vim.keymap.set('n', 'gas', '<Cmd>lua require(\'textcase\').current_word(\'to_snake_case\')<CR>')
