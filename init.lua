if vim.fn.exists "g:neovide" then
  local neovide_cfg = [[
  let g:neovide_fullscreen=v:true
  ]]
  vim.cmd(neovide_cfg)
end
-- set guifont = "Cascadia Code\ Nerd\ Font\ Complete\ Mono:h14"
-- vim.o.guifont = "Cascadia Code:h13"
vim.o.guifont = "CaskaydiaCove NFM:h13"

require("plugins")
require("keybindings")
require("basic")
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

require("dbg.nvim-dap")
