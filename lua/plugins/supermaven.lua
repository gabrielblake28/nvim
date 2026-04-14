return {
  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    opts = {
      keymaps = {
        accept_suggestion = "<Tab>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
      color = {
        suggestion_color = "#6b7280",
        cterm = 244,
      },
      ignore_filetypes = { TelescopePrompt = true },
      log_level = "warn",
    },
  },
}
