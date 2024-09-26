return {
  "catppuccin/nvim",
  lazy = true,
  name = "catppuccin",
  opts = {
    background = { -- :h background
      light = "latte",
      dark = "frappe",
    },
    term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
    transparent_background = false,
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { "italic" }, -- Change the style of comments
      conditionals = {},
      loops = {},
      functions = { "italic" },
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = { "italic" },
      operators = {},
      -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
  },
}
