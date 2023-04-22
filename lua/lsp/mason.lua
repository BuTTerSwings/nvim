require("mason-lspconfig").setup {
    ensure_installed = {
      "lua_ls", 
      "rust_analyzer",
      "clangd",
    },
    automatic_installation = false,
}

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("lspconfig").clangd.setup {}
require("lspconfig").lua_ls.setup {}
