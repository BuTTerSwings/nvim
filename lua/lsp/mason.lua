require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup {
    ensure_installed = {
      "lua_ls",
      -- "rust_analyzer",
      "clangd",
      "cmake",
    },
    automatic_installation = true,
}

require("lspconfig").clangd.setup {
  on_new_config = function(new_config, new_cwd)
    local status, cmake = pcall(require, "cmake-tools")
      if status then
          cmake.clangd_on_new_config(new_config)
      end
    end,
  on_attach = function(client, bufnr)
    local status, navic = pcall(require, "nvim-navic")
      if status then
          navic.attach(client, bufnr)
      end
    end,
}
require("lspconfig").lua_ls.setup {}
require("lspconfig").cmake.setup  {}
