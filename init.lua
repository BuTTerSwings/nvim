if vim.fn.exists "g:neovide" then
  local neovide_cfg = [[
  let g:neovide_fullscreen=v:true
  ]]
  vim.cmd(neovide_cfg)
end
vim.o.guifont = "CaskaydiaCove Nerd Font:h13"
-- vim.o.guifont = "Hack Nerd Font:h13"
-- vim.o.guifont = "JetBrainsMono Nerd Font:h11"

require("basic")
require("keybindings")
require("plugins")
require("colorscheme")

require("plugin-config.nvim-treesitter")
require("plugin-config.nvim-telescope")
require("plugin-config.nvim-tree")
require("plugin-config.nvim-autopairs")
require("plugin-config.noice")
require("plugin-config.dashboard")
require("plugin-config.impatient")
require("plugin-config.cmake-tools")
require("plugin-config.which-key")

require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")
require("lsp.formatter")
require("lsp.hover")

require("plugin-config.lualine")
require("plugin-config.bufferline")
require("plugin-config.winbar")
require("plugin-config.navic")

require("dbg.nvim-dap")
