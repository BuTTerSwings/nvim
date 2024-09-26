-- lualine
return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- dont show the winbar for some filetypes
    opts.options.disabled_filetypes.winbar = {
      "dashboard",
      "lazy",
      "lazyterm",
      "alpha",
      "neo-tree",
      "help",
      "dap-repl",
      "dapui_scopes",
      "dapui_breakpoints",
      "dapui_stacks",
      "dapui_watches",
      "dapui_console",
      "cmake_tools_terminal",
      "qf", --quickfix
      "trouble",
      "TelescopePrompt",
      "spectre_panel",
      "grug-far",
      "checkhealth",
      "leetcode.nvim",
      "gitsigns.blame",
    }
    -- remove navic from the statusline
    local trouble_navic = table.remove(opts.sections.lualine_c)
    local pretty_path = table.remove(opts.sections.lualine_c)
    local filetype_icon = table.remove(opts.sections.lualine_c)

    local complete_path = { "filename", path = 3 }
    -- add it to the winbar instead
    -- opts.winbar = { lualine_b = { filetype_icon, pretty_path }, lualine_c = { trouble_navic } }
    -- opts.inactive_winbar = { lualine_b = { filetype_icon, pretty_path } }

    local cmake = require("cmake-tools")
    local icons = require("config.icons")

    local Toolkits = "🛠️"
    local Search = "🔍"
    -- local Gear = "⚙️"

    local function ins_left(component)
      table.insert(opts.sections.lualine_c, component)
    end

    local function ins_right(component)
      table.insert(opts.sections.lualine_x, component)
    end

    ins_left({
      function()
        local c_preset = cmake.get_configure_preset()
        return "CMake: [" .. (c_preset and c_preset or "X") .. "]"
      end,
      icon = icons.ui.Search,
      cond = function()
        return cmake.is_cmake_project() and cmake.has_cmake_preset()
      end,
      separator = "",
      padding = { left = 0, right = 1 },
      on_click = function(n, mouse)
        if n == 1 then
          if mouse == "l" then
            vim.cmd("CMakeSelectConfigurePreset")
          end
        end
      end,
    })

    ins_left({
      function()
        local type = cmake.get_build_type()
        return "CMake: [" .. (type and type or "") .. "]"
      end,
      -- icon = icons.ui.Search,
      icon = Search,
      cond = function()
        return cmake.is_cmake_project() and not cmake.has_cmake_preset()
      end,
      separator = "",
      padding = { left = 1, right = 1 },
      on_click = function(n, mouse)
        if n == 1 then
          if mouse == "l" then
            vim.cmd("CMakeSelectBuildType")
          end
        end
      end,
    })

    ins_left({
      function()
        local kit = cmake.get_kit()
        return "[" .. (kit and kit or "X") .. "]"
      end,
      -- icon = icons.ui.Pencil,
      icon = Toolkits,
      cond = function()
        return cmake.is_cmake_project() and not cmake.has_cmake_preset()
      end,
      separator = "",
      padding = { left = 0, right = 1 },
      on_click = function(n, mouse)
        if n == 1 then
          if mouse == "l" then
            vim.cmd("CMakeSelectKit")
          end
        end
      end,
    })

    ins_left({
      function()
        return "Build"
      end,
      icon = icons.ui.Gear,
      cond = cmake.is_cmake_project,
      separator = "",
      padding = { left = 0, right = 1 },
      on_click = function(n, mouse)
        if n == 1 then
          if mouse == "l" then
            vim.cmd("CMakeBuild")
          end
        end
      end,
    })

    ins_left({
      function()
        local b_preset = cmake.get_build_preset()
        return "[" .. (b_preset and b_preset or "X") .. "]"
      end,
      icon = icons.ui.Search,
      cond = function()
        return cmake.is_cmake_project() and cmake.has_cmake_preset()
      end,
      separator = "",
      padding = { left = 0, right = 1 },
      on_click = function(n, mouse)
        if n == 1 then
          if mouse == "l" then
            vim.cmd("CMakeSelectBuildPreset")
          end
        end
      end,
    })

    ins_left({
      function()
        local b_target = cmake.get_build_target()
        return "[" .. (b_target and b_target or "X") .. "]"
      end,
      cond = cmake.is_cmake_project,
      separator = "",
      padding = { left = 0, right = 1 },
      on_click = function(n, mouse)
        if n == 1 then
          if mouse == "l" then
            vim.cmd("CMakeSelectBuildTarget")
          end
        end
      end,
    })

    ins_left({
      function()
        return icons.ui.Debug
      end,
      cond = cmake.is_cmake_project,
      separator = "",
      padding = { left = 0, right = 1 },
      on_click = function(n, mouse)
        if n == 1 then
          if mouse == "l" then
            -- vim.cmd("CMakeDebug")
            vim.cmd("DapContinue")
          end
        end
      end,
    })

    ins_left({
      function()
        return icons.ui.Run
      end,
      cond = cmake.is_cmake_project,
      separator = "",
      padding = { left = 1, right = 1 },
      on_click = function(n, mouse)
        if n == 1 then
          if mouse == "l" then
            vim.cmd("CMakeRun")
          end
        end
      end,
    })

    ins_left({
      function()
        local l_target = cmake.get_launch_target()
        return "[" .. (l_target and l_target or "X") .. "]"
      end,
      cond = cmake.is_cmake_project,
      separator = "",
      padding = { left = 0, right = 1 },
      on_click = function(n, mouse)
        if n == 1 then
          if mouse == "l" then
            vim.cmd("CMakeSelectLaunchTarget")
          end
        end
      end,
    })
  end,
}
