return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    keys = {
      { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Diffview: Close" },
      { "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: File History (current)" },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
      keymaps = {
        -- Unbind diffview's buffer-local <leader>e so the global
        -- Neo-tree toggle works inside diffview buffers too.
        -- Diffview's panel toggle remains on <leader>b>.
        view = {
          { "n", "<leader>e", false },
        },
        file_panel = {
          { "n", "<leader>e", false },
        },
        file_history_panel = {
          { "n", "<leader>e", false },
        },
      },
    },
  },
  {
    -- Reclaim <leader>gd for Diffview: LazyVim maps it to Snacks'
    -- "Git Diff (Hunks)" picker by default; this override wins because
    -- user specs merge after LazyVim's specs.
    "folke/snacks.nvim",
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview: Open" },
    },
  },
}
