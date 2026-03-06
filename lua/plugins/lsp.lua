-- lua/plugins/lsp.lua
-- Extend LazyVim's built-in lspconfig plugin instead of replacing it

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Make sure servers table exists
      opts.servers = opts.servers or {}
      opts.setup = opts.setup or {}

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

      -- Go LSP
      opts.servers.gopls = {
        settings = {
          gopls = {
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true,
            gofumpt = true,
          },
        },
      }

      local previous_gopls_setup = opts.setup.gopls
      opts.setup.gopls = function(server, server_opts)
        local previous_on_attach = server_opts.on_attach
        server_opts.on_attach = function(client, bufnr)
          client.server_capabilities.documentHighlightProvider = false
          if previous_on_attach then
            previous_on_attach(client, bufnr)
          end
        end

        if previous_gopls_setup then
          return previous_gopls_setup(server, server_opts)
        end
      end

      return opts
    end,
  },
}
