-- lua/plugins/lsp.lua
-- Extend LazyVim's built-in lspconfig plugin instead of replacing it

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Make sure servers table exists
      opts.servers = opts.servers or {}

      -- Add or tweak the vtsls server
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
            -- tsdk = "/path/to/your/workspace/node_modules/typescript/lib",
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
        -- If you want a custom on_attach just for vtsls:
        on_attach = function(client, bufnr)
          -- your custom logic here, or leave it out
        end,
      }

      -- Only attach eslint-lsp when an ESLint config is present in the project.
      -- lspconfig's util.root_pattern returns nil when no match is found, which
      -- prevents the server from starting for that buffer.
      opts.servers.eslint = {
        root_dir = require("lspconfig.util").root_pattern(
          ".eslintrc",
          ".eslintrc.js",
          ".eslintrc.cjs",
          ".eslintrc.mjs",
          ".eslintrc.yaml",
          ".eslintrc.yml",
          ".eslintrc.json",
          "eslint.config.js",
          "eslint.config.mjs",
          "eslint.config.cjs",
          "eslint.config.ts"
        ),
      }

      -- Go LSP
      opts.servers.gopls = {
        settings = {
          gopls = {
            hints = {
              assignVariableTypes = false,
              compositeLiteralFields = false,
              compositeLiteralTypes = false,
              constantValues = false,
              functionTypeParameters = false,
              parameterNames = false,
              rangeVariableTypes = false,
            },
            analyses = {
              unusedparams = true,
              shadow = true,
              unusedfunc = false,
            },
            staticcheck = false,
            gofumpt = true,
          },
        },
      }

      return opts
    end,
  },
}
