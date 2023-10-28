-- This file can be loaded by calling `lua require("plugins")` from your init.vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "andweeb/presence.nvim",
    "folke/neoconf.nvim",
    "folke/trouble.nvim",
    "folke/twilight.nvim",
    "laytan/cloak.nvim",
    "nvim-treesitter/playground",
    "mbbill/undotree",
    "nvim-lua/lsp-status.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-treesitter/nvim-treesitter-context",
    "theprimeagen/harpoon",
    "theprimeagen/refactoring.nvim",
    "timakro/vim-yadi",
    "tpope/vim-fugitive",
    "wakatime/vim-wakatime",

    "rescript-lang/vim-rescript",

    {
        "catppuccin/nvim",
        config = function()
            require("catppuccin").setup {
                transparent_background = true,
                integrations = {
                    harpoon = true,
                    mason = true,
                },
            }
            vim.cmd("colorscheme catppuccin")
        end,
    },
    {
        "folke/todo-comments.nvim",
        lazy = false,
        config = function()
            require("todo-comments").setup {}
        end,
    },
    {
        "folke/twilight.nvim",
        opts = {
            dimming = { alpha = 0.5 },
        },
    },
    {
        "folke/zen-mode.nvim",
        opts = {
            plugins = {
                kitty = {
                    enabled = true,
                },
            },
        },
    },
    {
        "freddiehaddad/feline.nvim",
        config = function()
            local ctp_feline = require("catppuccin.groups.integrations.feline")
            require("feline").setup({
                components = ctp_feline.get(),
            })
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "numToStr/Comment.nvim",
        lazy = false,
        config = function()
            require("Comment").setup {}
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    {
        "utilyre/barbecue.nvim",
        dependencies = {
            "SmiteshP/nvim-navic",
        },
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            -- LSP Support
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Autocompletion
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",

            -- Snippets
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        },
    },
})
