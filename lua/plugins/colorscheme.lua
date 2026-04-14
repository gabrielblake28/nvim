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
        color_overrides = {
          -- ensure exact Dark+ background/foreground
          vscBack = "#1E1E1E",
          vscFront = "#D4D4D4",
        },
        group_overrides = {
          -- ── Base vim highlight groups ──────────────────────────
          Comment = { fg = "#6A9955", italic = true },
          Keyword = { fg = "#C586C0" },
          Conditional = { fg = "#C586C0" },
          Repeat = { fg = "#C586C0" },
          Exception = { fg = "#C586C0" },
          Include = { fg = "#C586C0" },
          StorageClass = { fg = "#569CD6" },
          Function = { fg = "#DCDCAA" },
          String = { fg = "#CE9178" },
          Character = { fg = "#CE9178" },
          Number = { fg = "#B5CEA8" },
          Float = { fg = "#B5CEA8" },
          Boolean = { fg = "#569CD6" },
          Type = { fg = "#4EC9B0" },
          Constant = { fg = "#4FC1FF" },
          Identifier = { fg = "#9CDCFE" },
          Operator = { fg = "#D4D4D4" },
          Delimiter = { fg = "#D4D4D4" },
          Special = { fg = "#D7BA7D" },
          SpecialChar = { fg = "#D7BA7D" },
          LspReferenceText = { bg = "#2A2D2E", underline = false },
          LspReferenceRead = { bg = "#2A2D2E", underline = false },
          LspReferenceWrite = { bg = "#3A2F2F", underline = false },

          -- ── Treesitter: keywords & control flow ───────────────
          ["@keyword"] = { fg = "#C586C0" },
          ["@keyword.import"] = { fg = "#C586C0" },
          ["@keyword.export"] = { fg = "#C586C0" },
          ["@keyword.return"] = { fg = "#C586C0" },
          ["@keyword.function"] = { fg = "#569CD6" },
          ["@keyword.operator"] = { fg = "#569CD6" },
          ["@keyword.conditional"] = { fg = "#C586C0" },
          ["@keyword.repeat"] = { fg = "#C586C0" },
          ["@keyword.exception"] = { fg = "#C586C0" },
          ["@keyword.coroutine"] = { fg = "#C586C0" },
          ["@keyword.storage"] = { fg = "#569CD6" },

          -- ── Treesitter: functions ─────────────────────────────
          ["@function"] = { fg = "#DCDCAA" },
          ["@function.call"] = { fg = "#DCDCAA" },
          ["@function.builtin"] = { fg = "#DCDCAA" },
          ["@function.method"] = { fg = "#DCDCAA" },
          ["@function.method.call"] = { fg = "#DCDCAA" },
          ["@constructor"] = { fg = "#4EC9B0" },

          -- ── Treesitter: variables & identifiers ───────────────
          ["@variable"] = { fg = "#9CDCFE" },
          ["@variable.parameter"] = { fg = "#9CDCFE" },
          ["@variable.member"] = { fg = "#9CDCFE" },
          ["@variable.builtin"] = { fg = "#569CD6" },
          ["@property"] = { fg = "#9CDCFE" },
          ["@field"] = { fg = "#9CDCFE" },

          -- ── Treesitter: types & classes ────────────────────────
          ["@type"] = { fg = "#4EC9B0" },
          ["@type.builtin"] = { fg = "#4EC9B0" },
          ["@module"] = { fg = "#4EC9B0" },

          -- ── Treesitter: literals ──────────────────────────────
          ["@string"] = { fg = "#CE9178" },
          ["@string.escape"] = { fg = "#D7BA7D" },
          ["@string.regex"] = { fg = "#D16969" },
          ["@string.special"] = { fg = "#D7BA7D" },
          ["@number"] = { fg = "#B5CEA8" },
          ["@number.float"] = { fg = "#B5CEA8" },
          ["@boolean"] = { fg = "#569CD6" },
          ["@constant"] = { fg = "#4FC1FF" },
          ["@constant.builtin"] = { fg = "#569CD6" },

          -- ── Treesitter: operators & punctuation ───────────────
          ["@operator"] = { fg = "#D4D4D4" },
          ["@punctuation.bracket"] = { fg = "#D4D4D4" },
          ["@punctuation.delimiter"] = { fg = "#D4D4D4" },
          ["@punctuation.special"] = { fg = "#569CD6" },

          -- ── Treesitter: misc ──────────────────────────────────
          ["@label"] = { fg = "#C8C8C8" },
          ["@tag"] = { fg = "#569CD6" },
          ["@tag.attribute"] = { fg = "#9CDCFE" },
          ["@tag.delimiter"] = { fg = "#808080" },

          -- ── LSP semantic tokens (generic) ─────────────────────
          ["@lsp.type.function"] = { fg = "#DCDCAA" },
          ["@lsp.type.method"] = { fg = "#DCDCAA" },
          ["@lsp.type.variable"] = { fg = "#9CDCFE" },
          ["@lsp.type.parameter"] = { fg = "#9CDCFE" },
          ["@lsp.type.property"] = { fg = "#9CDCFE" },
          ["@lsp.type.type"] = { fg = "#4EC9B0" },
          ["@lsp.type.typeParameter"] = { fg = "#4EC9B0" },
          ["@lsp.type.interface"] = { fg = "#4EC9B0" },
          ["@lsp.type.namespace"] = { fg = "#4EC9B0" },
          ["@lsp.type.class"] = { fg = "#4EC9B0" },
          ["@lsp.type.struct"] = { fg = "#4EC9B0" },
          ["@lsp.type.enum"] = { fg = "#4EC9B0" },
          ["@lsp.type.enumMember"] = { fg = "#4FC1FF" },
          ["@lsp.type.keyword"] = { fg = "#C586C0" },
          ["@lsp.mod.defaultLibrary"] = {},
          ["@lsp.mod.readonly"] = {},
          ["@lsp.typemod.function.defaultLibrary"] = { fg = "#DCDCAA" },
          ["@lsp.typemod.variable.readonly"] = { fg = "#9CDCFE" },
          ["@lsp.typemod.variable.local"] = { fg = "#9CDCFE" },
          ["@lsp.typemod.parameter.readonly"] = { fg = "#9CDCFE" },

          -- ── LSP semantic tokens (Go-specific) ─────────────────
          ["@lsp.type.function.go"] = { fg = "#DCDCAA" },
          ["@lsp.type.method.go"] = { fg = "#DCDCAA" },
          ["@lsp.type.variable.go"] = { fg = "#9CDCFE" },
          ["@lsp.type.parameter.go"] = { fg = "#9CDCFE" },
          ["@lsp.type.property.go"] = { fg = "#9CDCFE" },
          ["@lsp.type.namespace.go"] = { fg = "#4EC9B0" },
          ["@lsp.type.struct.go"] = { fg = "#4EC9B0" },
          ["@lsp.type.type.go"] = { fg = "#4EC9B0" },
          ["@lsp.type.typeParameter.go"] = { fg = "#4EC9B0" },
          ["@lsp.type.interface.go"] = { fg = "#4EC9B0" },
          ["@lsp.type.keyword.go"] = { fg = "#C586C0" },
          ["@lsp.typemod.function.defaultLibrary.go"] = { fg = "#DCDCAA" },
          ["@lsp.typemod.variable.readonly.go"] = { fg = "#9CDCFE" },
          ["@lsp.typemod.variable.globalScope.go"] = { fg = "#9CDCFE" },
          ["@lsp.typemod.variable.fileScope.go"] = { fg = "#9CDCFE" },
          ["@lsp.typemod.parameter.readonly.go"] = { fg = "#9CDCFE" },
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
