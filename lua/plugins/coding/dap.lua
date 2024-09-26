return {
  "mfussenegger/nvim-dap",
  opts = function()
    local dap = require("dap")
    if not dap.adapters["cppdbg"] then
      require("dap").adapters["cppdbg"] = {
        id = "cppdbg",
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7.cmd",
        options = {
          detached = false,
        },
      }
    end
    for _, lang in ipairs({ "c", "cpp" }) do
      dap.configurations[lang] = {
        {
          type = "cppdbg",
          request = "launch",
          name = "Launch file(cpptools)",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          setupCommands = {
            {
              text = "-enable-pretty-printing",
              description = "enable pretty printing",
              ignoreFailures = false,
            },
          },
        },
        {
          type = "cppdbg",
          request = "attach",
          name = "Attach to process(cpptools)",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
          setupCommands = {
            {
              text = "-enable-pretty-printing",
              description = "enable pretty printing",
              ignoreFailures = false,
            },
          },
        },
      }
    end
  end,
}
