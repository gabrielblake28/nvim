return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local keys = opts.keys or {}
      vim.list_extend(keys, {
        { "K", vim.lsp.buf.hover, desc = "Hover Documentation" },
      })
      opts.keys = keys
    end,
  },
}
