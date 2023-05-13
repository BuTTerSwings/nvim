local db = require("dashboard")

db.setup {
  theme = 'doom',
  config = {
    footer = {
      '',
      '',
    },

    center = {
      {
        icon = "                     ",
        desc = "Projects                            ",
        action = "Telescope project",
      },
      -- {
      --   icon = "                     ",
      --   desc = "Edit Projects                       ",
      --   action = "edit ~/.local/share/nvim/project_nvim/project_history",
      -- },
      {
        icon = "                     ",
        desc = "Recently files                      ",
        action = "Telescope oldfiles",
      },
      {
        icon = '                     ',
        desc = 'Find file                           ',
        action = 'Telescope find_files',
      },
      {
        icon = "                     ",
        desc = "Find text                           ",
        action = "Telescope live_grep",
      },
      {
        icon = '                     ',
        desc = 'Edit keybindings                    ',
        action = 'edit ~/appdata/local/nvim/lua/keybindings.lua',
      },
      -- {
      --   icon = '                     ',
      --   icon_hl = 'title',
      --   desc = 'Edit PowerShell                     ',
      --   desc_hl = 'string',
      --   action = 'edit D:/UsersData/Documents/PowerShell/Microsoft.PowerShell_profile.ps1',
      -- },
      {
        icon = '                     ',
        desc = 'Change colorscheme                  ',
        action = 'Telescope colorscheme',
      },
      {
        icon = '                     ',
        desc = "Edit init.lua                       ",
        action = 'edit ~/appdata/local/nvim/init.lua',
      },
      {
        icon = '                     ',
        desc = 'Plugins                             ',
        action = 'edit ~/appdata/local/nvim/lua/plugins.lua',

      },
      {
        icon = '                     ',
        desc = "Quit anyway                         ",
        action = "qa!"
      },
    },

    header = {
    [[]],
    [[                                                   ]],
    [[                                                   ]],
    [[                                                   ]],
    [[                                                   ]],
    [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
    [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
    [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
    [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
    [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
    [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
    [[                                                   ]],
    [[                [ version : 0.9.0 ]                ]],
    [[                                                   ]],
    [[                                                   ]],
    [[                                                   ]],
    },
  }
}
