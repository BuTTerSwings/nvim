return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
        ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗       
        ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║       
        ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║       
        ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║       
        ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║       
        ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝       
      ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
      -- opts.theme = "doom"
      -- opts.hide = {
      --   statusline = true, -- hide statusline default is true
      --   tabline = true,    -- hide the tabline
      --   winbar = true,     -- hide winbar
      -- }
    end,
  },
}
