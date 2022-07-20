vim.o.termguicolors = true

require('bufferline').setup {
  options = {
    diagnostics = 'nvim_lsp',
    diagnostics_indicator = function(_, _, diagnostics_dict, _)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " "
            or (e == "warning" and " " or "")
        s = s .. n .. sym
      end
      return s
    end,
    offsets = {
      {
        filetype = "NvimTree",
      }
    },
  }
}

-- Keybindings
vim.keymap.set('n', 'gt', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gT', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
