return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local c = require("vscode.colors").get_colors()
      require("vscode").setup({
        style = "dark",
        transparent = false,
        italic_comments = true,
        -- stronger dark+ look
        group_overrides = {
          Comment = { fg = "#6A9955", italic = true },
          Keyword = { fg = "#C586C0" },
          Function = { fg = "#DCDCAA" },
          String = { fg = "#CE9178" },
          Number = { fg = "#B5CEA8" },
          Type = { fg = "#4EC9B0" },
          Constant = { fg = "#9CDCFE" },
          Identifier = { fg = "#9CDCFE" },
          ["@function"] = { fg = "#DCDCAA" },
          ["@keyword"] = { fg = "#C586C0" },
          ["@string"] = { fg = "#CE9178" },
          ["@type"] = { fg = "#4EC9B0" },
          ["@number"] = { fg = "#B5CEA8" },
          ["@constant"] = { fg = "#9CDCFE" },
          ["@variable"] = { fg = "#9CDCFE" },
        },
      })
      require("vscode").load()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "vscode" },
  },
}
