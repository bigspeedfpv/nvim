-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'

    use { 'romgrk/barbar.nvim',
        requires = 'nvim-web-devicons',
        config = function()
            require("barbar").setup {
                sidebar_filetypes = {
                    NvimTree = { text = "NvimTree" },
                    undotree = { text = "UndoTree" },
                }
            }
        end
    }

    use 'andweeb/presence.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        'folke/tokyonight.nvim',
        config = function()
            require("tokyonight").setup({ style = "night", transparent = true })
            vim.cmd('colorscheme tokyonight')
        end
    })

    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })


    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("nvim-treesitter/playground")
    use("theprimeagen/harpoon")
    use("theprimeagen/refactoring.nvim")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("nvim-treesitter/nvim-treesitter-context")

    use 'esensar/nvim-dev-container'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use("folke/zen-mode.nvim")
    use("github/copilot.vim")
    use("eandrju/cellular-automaton.nvim")
    use("laytan/cloak.nvim")

    use {
        'nvim-lualine/lualine.nvim',
    }

    use("timakro/vim-yadi")

    use("christoomey/vim-tmux-navigator")

    use("wakatime/vim-wakatime")

    use {
        "lvimuser/lsp-inlayhints.nvim",
        branch = "anticonceal",
    }

    use "nvim-lua/lsp-status.nvim"

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- use {
    --     "m4xshen/hardtime.nvim",
    --     config = function()
    --         require("hardtime").setup({
    --             restricted_keys = {
    --                 ["h"] = { "n", "v" },
    --                 ["j"] = { "n", "v" },
    --                 ["k"] = { "n", "v" },
    --                 ["l"] = { "n", "v" },
    --                 ["-"] = { "n", "v" },
    --                 ["+"] = { "n", "v" },
    --                 ["gj"] = { "n", "v" },
    --                 ["gk"] = { "n", "v" },
    --                 ["<CR>"] = { "n", "v" },
    --                 ["<C-M>"] = { "n", "v" },
    --                 ["<C-N>"] = { "n", "v" },
    --             }
    --         })
    --     end
    -- }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
