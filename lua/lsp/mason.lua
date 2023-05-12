
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
