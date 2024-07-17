return {
  {
    "andweeb/presence.nvim",
    opts = {
      main_image = "file",
      neovim_image_text = "hi",
      log_level = "error",
    },
  },

  { "wakatime/vim-wakatime" },

  -- { "github/copilot.vim" },

  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },
}
