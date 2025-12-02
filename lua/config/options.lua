-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Keep at least 15 lines visible above/below cursor
vim.opt.scrolloff = 50
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
vim.opt.termguicolors = true

-- Disable swapfiles to prevent E325 errors in Snacks explorer
vim.opt.swapfile = false

-- User command to clean up leftover swapfiles in the current project
vim.api.nvim_create_user_command("PurgeSwap", function()
  vim.fn.system({ "find", ".", "-type", "f", "-name", "*.swp", "-delete" })
  vim.notify("Purged all .swp files in current directory", vim.log.levels.INFO)
end, { desc = "Delete all .swp files in current directory tree" })
