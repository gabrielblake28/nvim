-- lua/config/keymaps.lua

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Normal mode mappings
map("n", "<leader>o", "o<Esc>", { desc = "Add empty line below" })
map("n", "<leader>O", "O<Esc>", { desc = "Add empty line above" })

map("n", "<leader>rs", ":source ~/.config/nvim/lua/config/keymaps.lua<CR>", { desc = "Reload keymaps config" })

map("n", "<leader>rt", ":source ~/.config/nvim/lua/plugins/neo-tree.lua<CR>", { desc = "Reload neo-tree config" })

map("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover Documentation" })

-- Insert mode mappings
map("i", "<D-CR>", function()
  return "<Esc>o"
end, { expr = true, desc = "Insert line below (Cmd+Enter)" })

map("i", "<D-S-CR>", function()
  return "<Esc>O"
end, { expr = true, desc = "Insert line above (Cmd+Shift+Enter)" })
