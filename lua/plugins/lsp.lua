return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "typescript-language-server",
      },
    },
  },

  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      -- opts.mapping = vim.tbl_extend("force", opts.mapping, {
      --   ["<Tab>"] = cmp.mapping(function(fallback)
      --     if cmp.visible() then
      --       cmp.select_next_item()
      --     -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
      --     -- this way you will only jump inside the snippet region
      --     elseif luasnip.expand_or_jumpable() then
      --       luasnip.expand_or_jump()
      --     elseif has_words_before() then
      --       cmp.complete()
      --     else
      --       fallback()
      --     end
      --   end, { "i", "s" }),
      --   ["<S-Tab>"] = cmp.mapping(function(fallback)
      --     if cmp.visible() then
      --       cmp.select_prev_item()
      --     elseif luasnip.jumpable(-1) then
      --       luasnip.jump(-1)
      --     else
      --       fallback()
      --     end
      --   end, { "i", "s" }),
      -- })
    end,

    keys = false,
  },

  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      autoformat = false,
      ---@type lspconfig.options
      servers = {
        ocamllsp = {
          mason = false,
        },

        -- tsserver will be automatically installed with mason and loaded with lspconfig
        tsserver = {
          mason = false,
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = "",
                langauges = { "typescript", "vue" },
              },
            },
          },
        },

        -- tailwindcss = { mason = false },
        rust_analyzer = { mason = false },
        zls = { mason = false },
        clangd = { mason = false },
        gopls = { mason = false },
        nil_ls = { mason = false },
        hls = { mason = false },
        astro = { mason = false },
        mdx_analyzer = { mason = false },
        svelte = { mason = false },

        volar = { mason = false },

        basedpyright = { mason = false },
        ruff = { mason = false },

        kotlin_language_server = { mason = false },
        metals = { mason = false },
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- [] = function(server, opts) end,
      },
    },
  },

  -- nvim-metals
  -- {
  --   "scalameta/nvim-metals",
  --   ft = { "scala", "sbt" },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   -- stylua: ignore
  --   keys = {
  --     { "<leader>cW", function () require('metals').hover_worksheet() end, desc = "Metals Worksheet" },
  --     { "<leader>cM", function () require('telescope').extensions.metals.commands() end, desc = "Telescope Metals Commands" },
  --   },
  --   init = function()
  --     local metals_config = require("metals").bare_config()
  --
  --     metals_config.settings = {
  --       showImplicitArguments = true,
  --       showImplicitConversionsAndClasses = true,
  --       showInferredType = true,
  --       superMethodLensesEnabled = true,
  --     }
  --     metals_config.init_options.statusBarProvider = "on"
  --     metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
  --
  --     local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
  --     vim.api.nvim_create_autocmd("FileType", {
  --       pattern = { "scala", "sbt" },
  --       callback = function()
  --         require("metals").initialize_or_attach(metals_config)
  --       end,
  --       group = nvim_metals_group,
  --     })
  --   end,
  -- },
}
