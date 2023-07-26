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
    "christoomey/vim-tmux-navigator",
    "folke/todo-comments.nvim",
    "folke/trouble.nvim",
    "folke/zen-mode.nvim",
    "github/copilot.vim",
    "laytan/cloak.nvim",
    "lvimuser/lsp-inlayhints.nvim",
    "nvim-treesitter/playground",
    "mbbill/undotree",
    "numToStr/Comment.nvim",
    "nvim-lua/lsp-status.nvim",
    "nvim-treesitter/nvim-treesitter-context",
    "theprimeagen/harpoon",
    "theprimeagen/refactoring.nvim",
    "timakro/vim-yadi",
    "tpope/vim-fugitive",
    "wakatime/vim-wakatime",

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
