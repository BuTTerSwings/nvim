local list_keys = require("keybindings").nvimTreeList
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    disable_netrw = true,
    -- git's attribute enable should be false
    -- otherwise the nvim-tree will crash due to the \zh
    -- in machines which are using Chinese
    git = {
      enable = false,
    },
    view = {
        width = 30,
        -- mappings = {
	      -- custom_only = true,
        --    list = list_keys,
        -- },
	  signcolumn = 'yes',
    },
    renderer = {
        group_empty = true
    },

    -- update to current file
    update_cwd = false,
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },

    filters = {
        -- dotfiles = true
    }
})
