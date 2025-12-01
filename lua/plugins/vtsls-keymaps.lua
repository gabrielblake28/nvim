return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          keys = {
            {
              "<leader>ri",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.removeUnusedImports" }, -- imports only
                    diagnostics = {},
                  },
                })
              end,
              desc = "Remove unused imports (VTSLS)",
            },
          },
        },
      },
    },
  },
}
