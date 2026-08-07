return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        eslint = {
          root_dir = function(fname)
            local util = require("lspconfig.util")
            return util.root_pattern(
              "eslint.config.js",
              "eslint.config.mjs",
              "eslint.config.cjs",
              ".eslintrc",
              ".eslintrc.js",
              ".eslintrc.cjs",
              ".eslintrc.yaml",
              ".eslintrc.yml",
              ".eslintrc.json"
            )(fname)
          end,
        },
      },
    },
  },
}
