local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit')
-- Move Tab
keymap.set('n', 'tm', ':tabmove')
-- Close Current Tab
keymap.set('n', 'tc', ':tabclose<Return>')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')
-- Move Buffer
-- keymap.set('n', 'bn', ':bn<Return>')
-- keymap.set('n', 'bp', ':bp<Return>')
-- keymap.set('n', 'bm', ':bm<Return>')

-- Escape
keymap.set('i', 'jj', '<Esc>')
