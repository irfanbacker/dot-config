local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local is_unix = vim.fn.has("unix") == 1
local is_win32 = vim.fn.has("win32") == 1
local configure_path
if is_unix then
  configure_path = "~/.config/nvim/"
elseif is_win32 then
  configure_path = "~/AppData/Local/nvim/"
end

local dashboard = require("alpha.themes.dashboard")

local header = {
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                     ",
}

-- Make the header a bit more fun with some color!
local function colorize_header()
  local lines = {}

  for i, chars in pairs(header) do
    local line = {
      type = "text",
      val = chars,
      opts = {
        hl = "StartLogo" .. i,
        shrink_margin = false,
        position = "center",
      },
    }

    table.insert(lines, line)
  end

  return lines
end

dashboard.section.buttons.val = {
  dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
  dashboard.button("c", "  Configuration", ":e" .. configure_path .. "<CR>"),
  dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

dashboard.section.footer.opts.hl = "Type"
dashboard.section.buttons.opts.hl = "Include"
dashboard.opts.opts.noautocmd = true

alpha.setup({
  layout = {
    { type = "padding", val = 4 },
    { type = "group", val = colorize_header() },
    { type = "padding", val = 2 },
    dashboard.section.buttons,
    dashboard.section.footer,
  },
  opts = dashboard.opts,
})
