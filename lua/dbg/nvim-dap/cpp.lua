local dap = require('dap')

dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = "C:/Users/zhu14/appdata/local/nvim-data/mason/bin/OpenDebugAD7.cmd",
  options = {
    detached = false,
  },
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description =  'enable pretty printing',
        ignoreFailures = false
      },
    }
  },
}



dap.configurations.c = dap.configurations.cpp

