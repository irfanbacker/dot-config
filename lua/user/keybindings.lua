local opts = { noremap = true }
-- Format buffer keybind
vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting_sync, opts)
-- Newline keybinds in Normal mode
vim.keymap.set('n', 'o', 'o<Esc>', opts)
vim.keymap.set('n', 'O', "O<Esc>", opts)
-- Close window
vim.keymap.set('n', '<leader>wq', '<cmd>q<CR>', opts)
-- Save buffer
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', opts)
