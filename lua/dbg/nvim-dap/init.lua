require("neodev").setup({

  library = { plugins = {"nvim-dap-ui" }, types =true },
})

local dap = require("dap")
local dapui = require("dapui")
require("nvim-dap-virtual-text").setup {
    enabled = true,                        -- enable this plugin (the default)
    enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,               -- show stop reason when stopped for exceptions
    commented = false,                     -- prefix virtual text with comment string
    only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
    all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
    --- A callback that determines how a variable is displayed or whether it should be omitted
    --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
    --- @param buf number
    --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
    --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
    --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
    --
    -- display_callback = function(variable, _buf, _stackframe, _node)
    --   return variable.name .. ' = ' .. variable.value
    -- end,

    -- experimental features:
    virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
                                           -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}

vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0 })
vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0 })
vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, })

local dap_breakpoint = {
    error = {
        text = "🛑",
        texthl = "DapBreakpoint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
    },
    condition = {
        text = 'ﳁ',
        texthl = 'DapBreakpoint',
        linehl = 'DapBreakpoint',
        numhl = 'DapBreakpoint',
    },
    rejected = {
        text = "",
        texthl = "DapBreakpint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
    },
    logpoint = {
        text = '',
        texthl = 'DapLogPoint',
        linehl = 'DapLogPoint',
        numhl = 'DapLogPoint',
    },
    stopped = {
        text = '',
        texthl = 'DapStopped',
        linehl = 'DapStopped',
        numhl = 'DapStopped',
    },
}

vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
vim.fn.sign_define('DapBreakpointCondition', dap_breakpoint.condition)
vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
vim.fn.sign_define('DapLogPoint', dap_breakpoint.logpoint)
vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)



dapui.setup({
  element_mappings = {
    scopes = {
      edit = "e",
      expand = "o",
      repl = "r",
    },
    watches = {
      remove = "d",
      edit = "e",
      repl = "r",
    },
    stacks = {
      open = "<CR>",
    },
    breakpoints = {
      open = "g",
      toggle = "b",
    },
  },

  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        "scopes",
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 0.2, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
    {
      elements = {
        "console",
      },
      size = 0.2,
      position = "right",
    },
  },

  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "rounded", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
})

dap.listeners.after.event_initialized["dapui_config"] = function ()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function ()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function ()
  dapui.close()
end

require("dbg.nvim-dap.cpp")
