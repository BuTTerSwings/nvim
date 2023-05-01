local common = require("lsp.common-config")
local opts = {
  capabilities = common.capabilities,
  flags = common.flags,
  on_attach = function (client, bufnr)
    common.disableFormat(client)
    common.keyAttach(bufnr)
  end,
}

return {
  on_setup = function (server)
    server.on_setup({
      flags = {
        debounce_text_changes = 150,
      },
      on_attach = function (client, bufnr)
        -- disable formatter
        client.server.capabilities.document_formatting = false
        client.server.capabilities.document_range_formatting = false
        local function buf_set_keymap(...)
          vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        require("keybindings").mapLSP(buf_set_keymap)
      end,
    })
  end,
}
