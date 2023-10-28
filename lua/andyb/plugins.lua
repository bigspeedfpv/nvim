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
                    fidget = true,
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
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        opts = {
            window = { blend = 0 },
            text = { spinner = "dots_snake" },
        },
    },

    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require 'cmp'

            cmp.setup {
                snippet = {
                    expand = function(args)
                        require 'luasnip'.lsp_expand(args.body)
                    end
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'vsnip' }, -- For vsnip users.
                    -- { name = 'luasnip' }, -- For luasnip users.
                    -- { name = 'ultisnips' }, -- For ultisnips users.
                    -- { name = 'snippy' }, -- For snippy users.
                }, {
                    { name = 'buffer' },
                })
            }
        end,
    },

    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
})
