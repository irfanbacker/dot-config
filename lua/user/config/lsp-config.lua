local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local common_on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("v", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()CR>", opts)
  buf_set_keymap("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  buf_set_keymap("n", "<leader>o", [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])

  -- Highlight word occurences
  require("illuminate").on_attach(client)

  -- Code context
  require("nvim-navic").attach(client, bufnr)
end

local lspconfig = require("lspconfig")

local servers = { "vimls", "gopls", "marksman", "jsonls", "yamlls", "clangd", "pyright", "rust_analyzer", "dartls",
  "tsserver", "sumneko_lua", "jdtls" }

lsp_installer.setup({
  ensure_installed = servers,
})

for _, server in pairs(servers) do
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local opts = {
    on_attach = common_on_attach,
    capabilities = capabilities,
  }
  lspconfig[server].setup(opts)
end

-- format buffer keybind
vim.keymap.set("n", "<leader>f", vim.lsp.buf.formatting_sync, { noremap = true })

-- Show code action bulb on cursor hold
vim.cmd [[let g:cursorhold_updatetime = 100]]
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()]]

vim.g.Illuminate_ftblacklist = { 'NvimTree' }
-- Illuminate keybindings
vim.keymap.set('n', '<a-n>', function() require("illuminate").next_reference { wrap = true } end, { noremap = true })
vim.keymap.set('n', '<a-m>', function() require("illuminate").next_reference { reverse = true, wrap = true } end,
  { noremap = true })
