local status_mason, mason = pcall(require, "mason")
if not status_mason then
	return
end

local status_mason_config, mason_config = pcall(require, "mason-lspconfig")
if not status_mason_config then
	return
end

local status_lspconfig, lspconfig = pcall(require, "lspconfig")
if not status_lspconfig then
	return
end

mason.setup({
  ui = {
    icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
    }
  }
})

mason_config.setup {
    ensure_installed = {
      "lua_ls",
      "clangd",
      "neocmake",
    },
    automatic_installation = true,
}

local servers = {
	lua_ls = require("lsp.config.lua"),
	clangd = require("lsp.config.clangd"),
	neocmake = require("lsp.config.cmake"),
}

for name, config in pairs(servers) do
	if config ~= nil and type(config) == "table" then
    -- on_setup should be impleached
		config.on_setup(lspconfig[name])
	else
		-- use default setup paras
		lspconfig[name].setup({})
	end
end

require("lsp.ui")
