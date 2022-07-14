require('trouble').setup()

-- Keybindings
local opts = { noremap = true }
vim.keymap.set('n', 'tt', '<cmd>TroubleToggle<cr>', opts)
vim.keymap.set('n', 'tw', '<cmd>TroubleToggle workspace_diagnostics<cr>', opts)
vim.keymap.set('n', 'td', '<cmd>TroubleToggle document_diagnostics<cr>', opts)
vim.keymap.set('n', 'tq', '<cmd>TroubleToggle quickfix<cr>', opts)
vim.keymap.set('n', 'tl', '<cmd>TroubleToggle loclist<cr>', opts)
vim.keymap.set('n', 'tr', '<cmd>TroubleToggle lsp_references<cr>', opts)
