local colorscheme = "gruvbox-flat"
-- onedark_vivid
-- onenord
-- catppuccin-latte
-- catppuccin-frappe
-- catppuccin-macchiato
-- catppuccin-mocha
-- tokyonight-night
-- tokyonight-storm
-- tokyonight-day
-- tokyonight-moon
-- ...

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme: " .. colorscheme .. " could not be found!")
  return
end
