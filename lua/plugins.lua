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

    ------------------------- telescope ------------------------

    "nvim-lua/plenary.nvim",
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
      'nvim-telescope/telescope-ui-select.nvim',
      dependencies = 'nvim-telescope/telescope.nvim',
    },

    {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },

    {
      'nvim-telescope/telescope-project.nvim',
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-telescope/telescope-file-browser.nvim"}
    },
    ------------------------------------------------------------

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
    -------------------------- tools ---------------------------
    -- cmake-tools
    {
      "Civitasv/cmake-tools.nvim",
      dependencies = 'nvim-lua/plenary.nvim',
    },

    ----------------------- status bars ------------------------
    -- lualine
    {
      "nvim-lualine/lualine.nvim",
      dependencies = 'nvim-tree/nvim-web-devicons',
      -- opt = true,
    },
    {
      'arkav/lualine-lsp-progress',
      dependencies = "nvim-lualine/lualine.nvim",
    },

    -- lualine time
    {
      'archibate/lualine-time',
      dependencies = "nvim-lualine/lualine.nvim",
    },

    -- bufferline
    {
      'akinsho/bufferline.nvim',
      version = "3.*",
      dependencies = 'nvim-tree/nvim-web-devicons'
    },
    -- close buffers
    "moll/vim-bbye",

    -- winbar
    'fgheng/winbar.nvim',

    -- navic vscode like components
    {
      "SmiteshP/nvim-navic",
      dependencies = "neovim/nvim-lspconfig",
    },

    --------------------------  lsp  ---------------------------
    -- lsp installer
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate" -- :MasonUpdate updates registry contents
    },
    -- configuration of lsp
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "ray-x/lsp_signature.nvim",

    -- cmp
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'hrsh7th/cmp-nvim-lsp-signature-help',

    -- snippets
    "rafamadriz/friendly-snippets",

    -- lsp ui
    "onsails/lspkind-nvim",
    "kkharji/lspsaga.nvim",

    "lewis6991/hover.nvim",

    -- formatter
    "mhartington/formatter.nvim",

    -- autopairs
    "windwp/nvim-autopairs",

    -- outline
    {
      'simrat39/symbols-outline.nvim',
      config = function ()
        require("symbols-outline").setup({
          width = 100,
          auto_close = true,
          auto_preview = false,
          highlight_hovered_item = false,
        })
      end,
    },

    -------------------------- debug ---------------------------
    "mfussenegger/nvim-dap",
    {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      dependencies = {"mfussenegger/nvim-dap"}
    },
    ----------------------- colorscheme ------------------------
    -- colorscheme onedarkpro
    {
      "olimorris/onedarkpro.nvim",
      -- tag = "0.8.0"
    },

    -- colorscheme onedark
    -- 'navarasu/onedark.nvim',

    -- colorscheme onehalf
    "szsdk/onehalf.nvim",
    'rktjmp/lush.nvim',

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

    -- colorscheme dracula
    "Mofiqul/dracula.nvim",

    -- colorscheme zephyr
    {
      "glepnir/zephyr-nvim",
      dependencies = 'nvim-treesitter/nvim-treesitter',
    },

    -- colorscheme vscode
    "Mofiqul/vscode.nvim",

    -- colorscheme one-nvim
    "Th3Whit3Wolf/one-nvim",

    -- colorscheme OnsetGlaze
    "abhidahal/OnsetGlaze.nvim",

    -- colorscheme gruvbox
    { "ellisonleao/gruvbox.nvim", priority = 1000 },

    -- colorscheme gruvbox-flat
    'eddyekofo94/gruvbox-flat.nvim',

    -- colorscheme gruvbox-material
    'wittyjudge/gruvbox-material.nvim',
  })
