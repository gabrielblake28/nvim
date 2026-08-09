return {
  {
    "lewis6991/hover.nvim",
    event = "LspAttach",
    keys = {
      { "K", function() require("hover").hover() end, desc = "Hover (hover.nvim)" },
      { "gK", function() require("hover").hover_select() end, desc = "Hover Select (hover.nvim)" },
      { "<C-p>", function() require("hover").hover_switch("previous") end, desc = "Hover Prev Source" },
      { "<C-n>", function() require("hover").hover_switch("next") end, desc = "Hover Next Source" },
    },
    config = function()
      require("hover").setup({
        init = function()
          require("hover.providers.lsp")
          require("hover.providers.diagnostic")
          require("hover.providers.man")
          require("hover.providers.dictionary")
        end,
        preview_opts = {
          border = "single",
        },
        preview_window = false,
        title = true,
        mouse_providers = { "LSP" },
        mouse_delay = 1000,
      })

      -- ── Frosted glass style ───────────────────────────────────
      local set_float_hl = function()
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#2A2A2E", fg = "#D4D4D4" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#2A2A2E", fg = "#6E7681" })
        vim.api.nvim_set_hl(0, "FloatTitle", { bg = "#2A2A2E", fg = "#9CDCFE", bold = true })
      end
      set_float_hl()
      vim.api.nvim_create_autocmd("ColorScheme", { callback = set_float_hl })

      -- Apply winblend (translucency) to floating windows for the frost effect.
      -- Scoped to floats only via `cfg.relative ~= ""`.
      vim.api.nvim_create_autocmd("WinNew", {
        callback = function()
          vim.schedule(function()
            local win = vim.api.nvim_get_current_win()
            if not vim.api.nvim_win_is_valid(win) then return end
            local cfg = vim.api.nvim_win_get_config(win)
            if cfg.relative and cfg.relative ~= "" then
              vim.wo[win].winblend = 10
            end
          end)
        end,
      })

      local strip_lazyvim_hover_keys = function(buf)
        vim.schedule(function()
          if vim.api.nvim_buf_is_valid(buf) then
            pcall(vim.keymap.del, "n", "K", { buffer = buf })
            pcall(vim.keymap.del, "n", "gK", { buffer = buf })
          end
        end)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args) strip_lazyvim_hover_keys(args.buf) end,
      })
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) and #vim.lsp.get_clients({ bufnr = buf }) > 0 then
          strip_lazyvim_hover_keys(buf)
        end
      end
    end,
  },
}
