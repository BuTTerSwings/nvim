-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- neovide
if vim.fn.exists("g:neovide") then
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_fullscreen = true
  vim.g.neovide_hide_mouse_when_typing = true
  -- vim.o.guifont = "JetBrainsMono Nerd Font:h13"
  -- vim.o.guifont = "CaskaydiaCove Nerd Font:h13"
  vim.o.guifont = "Hack Nerd Font:h13"
end

-- if vim.fn.exists("g:gonvim_running") then
--   vim.o.guifont = "JetBrainsMono NF:h13"
-- end

-- vim.g.trouble_lualine = false

vim.g.autoformat = false
vim.o.autochdir = true
vim.wo.relativenumber = false

vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- vim.o.shadafile = "NONE"

if vim.fn.has("win32") then
  vim.o.shell = "pwsh"
  vim.o.shellcmdflag =
    "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
  vim.o.shellxquote = ""
else
  -- vim.o.shell = "zsh"
end

-- vim.o.guicursor = "a:blinkon1-blinkoff250-blinkwait10"
