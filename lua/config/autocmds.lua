-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "\\[dap-repl-*\\]",
  callback = vim.schedule_wrap(function(args)
    vim.api.nvim_set_current_win(vim.fn.bufwinid(args.buf))
    vim.api.nvim_input("<space>ub")
    vim.api.nvim_input("<space>ub")
    vim.api.nvim_input("<space>snd")
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
      if string.match(bufname, "neo%-tree") then
        vim.api.nvim_win_close(win, true)
      end
    end
  end),
})
