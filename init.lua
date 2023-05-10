if vim.fn.exists "g:neovide" then
  local neovide_cfg = [[
  let g:neovide_fullscreen=v:true
  ]]
  vim.cmd(neovide_cfg)
end
vim.o.guifont = "CaskaydiaCove NF:h13"
-- vim.o.guifont = "Hack NFM:h14"
-- vim.o.guifont = "JetBrainsMono NFM:h13"

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

require("lsp.mason")
require("lsp.cmp")
require("lsp.ui")

require("plugin-config.lualine")
require("plugin-config.bufferline")
require("plugin-config.winbar")
require("plugin-config.navic")

require("dbg.nvim-dap")
