return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers["*"] = opts.servers["*"] or {}
      local keys = opts.servers["*"].keys or {}
      vim.list_extend(keys, {
        { "K", false },
        { "gK", false },
      })
      opts.servers["*"].keys = keys
    end,
  },
}
