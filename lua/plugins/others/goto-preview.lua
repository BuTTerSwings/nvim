return {
  "rmagatti/goto-preview",
  event = "LazyFile",
  config = function()
    require("goto-preview").setup({
      default_mappings = true,
      preview_window_title = { enable = false, position = "left" },
      -- post_open_hook = function(buf, win)
      --   local orig_state = vim.api.nvim_buf_get_option(buf, "modifiable")
      --   vim.api.nvim_buf_set_option(buf, "modifiable", false)
      --   vim.api.nvim_create_autocmd({ "WinLeave" }, {
      --     buffer = buf,
      --     callback = function()
      --       vim.api.nvim_win_close(win, false)
      --       vim.api.nvim_buf_set_option(buf, "modifiable", orig_state)
      --       return true
      --     end,
      --   })
      -- end,
    })
  end,
}
