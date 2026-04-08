-- lua/plugins/lsp.lua
-- Extend LazyVim's built-in lspconfig plugin instead of replacing it

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}

      opts.servers.vtsls = {
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
        settings = {
          vtsls = {
            enableMoveToFileCodeAction = true,
            autoUseWorkspaceTsdk = true,
            experimental = {
              completion = { enableServerSideFuzzyMatch = true },
            },
          },
          typescript = {
            updateImportsOnFileMove = { enabled = "always" },
            suggest = { completeFunctionCalls = true },
            inlayHints = {
              enumMemberValues = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              parameterNames = { enabled = "literals" },
              parameterTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              variableTypes = { enabled = false },
            },
          },
        },
        on_attach = function(client, bufnr)
          -- Let prettier handle formatting, not vtsls
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      }

      -- ESLint for rules/diagnostics only — root_dir ensures project config is always used
      opts.servers.eslint = {
        root_dir = require("lspconfig.util").root_pattern(
          ".eslintrc",
          ".eslintrc.js",
          ".eslintrc.cjs",
          ".eslintrc.yaml",
          ".eslintrc.yml",
          ".eslintrc.json",
          "eslint.config.js",
          "eslint.config.mjs",
          "eslint.config.cjs"
        ),
        on_attach = function(client, bufnr)
          -- ESLint handles linting only, not formatting
          client.server_capabilities.documentFormattingProvider = false
        end,
      }

      return opts
    end,
  },

  -- conform.nvim: prettier for styling, fallback to LSP if prettier not found
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript      = { "prettier", stop_after_first = true },
        javascriptreact = { "prettier", stop_after_first = true },
        typescript      = { "prettier", stop_after_first = true },
        typescriptreact = { "prettier", stop_after_first = true },
      },
      -- Fall back to LSP formatting when no project formatter is available
      default_format_opts = {
        lsp_fallback = true,
      },
    },
  },
}
