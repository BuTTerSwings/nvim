return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false,
    },
    autoformat = false,
    setup = {
      clangd = function(_, opts)
        opts.cmd = {
          "clangd",
          "--header-insertion=never",
          "--background-index",
          "--clang-tidy",
          "--completion-style=bundled",
          "--function-arg-placeholders=0",
          "--fallback-style=microsoft",
          "--query-driver=D:/ScoopApp/Scoop/apps/mingw/current/bin/g++.exe",
        }
      end,
    },
  },
}
