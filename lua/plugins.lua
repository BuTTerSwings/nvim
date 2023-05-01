-- lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({

    -- which-key
    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",

    -- impatient accelerate lua
    'lewis6991/impatient.nvim',

    -- nvim-treesitter
    "nvim-treesitter/nvim-treesitter",

    -- icons for plugins
    "nvim-tree/nvim-web-devicons",

    -- dashboard
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },

    -- file explorer nvim-tree
    "nvim-tree/nvim-tree.lua",

    -- telescope
    "nvim-lua/plenary.nvim",
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- noice
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    {
        "folke/noice.nvim",
        dependencies =
        {
          'MunifTanjim/nui.nvim',
          'rcarriga/nvim-notify'
        }
    },
    -- trouble
    {
      "folke/trouble.nvim",
      dependencies = "nvim-tree/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    },
    -- comment
    {
        "numToStr/Comment.nvim",
        config = function()
          require('Comment').setup {

          }
        end,
    },
    ----------------------- status bars ------------------------
    -- lualine
    "nvim-lualine/lualine.nvim",

    -- bufferline
    {
      'akinsho/bufferline.nvim',
      version = "v3.*",
      dependencies = 'nvim-tree/nvim-web-devicons'
    },
    -- close buffers
    "moll/vim-bbye",

    --------------------------  lsp  ---------------------------
    -- error lens
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate" -- :MasonUpdate updates registry contents
    },
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    -- cmp
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',

    -- autopairs
    "windwp/nvim-autopairs",
    -------------------------- debug ---------------------------
    "mfussenegger/nvim-dap",
    {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      dependencies = {"mfussenegger/nvim-dap"}
    },
    ----------------------- colorscheme ------------------------
    -- colorscheme onedarkpro
    "olimorris/onedarkpro.nvim",

    -- colorscheme onehalf
    "szsdk/onehalf.nvim",

    -- colorscheme onenord
    "rmehri01/onenord.nvim",

    -- colorscheme catppuccin
    { "catppuccin/nvim", name = "catppuccin" },

    -- colorscheme tokyonight
    "folke/tokyonight.nvim",

    -- colorscheme kanagawa
    "rebelot/kanagawa.nvim",

    -- colorscheme material
    "marko-cerovac/material.nvim",

    -- colorscheme nightfox
    "EdenEast/nightfox.nvim",
  })
