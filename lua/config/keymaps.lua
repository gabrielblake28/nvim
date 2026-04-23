-- lua/config/keymaps.lua

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Normal mode mappings
map("n", "<leader>oj", "o<Esc>", { desc = "Add empty line below" })
map("n", "<leader>ok", "O<Esc>", { desc = "Add empty line above" })

map("n", "<leader>rs", ":source ~/.config/nvim/lua/config/keymaps.lua<CR>", { desc = "Reload keymaps config" })

map("n", "<leader>rt", ":source ~/.config/nvim/lua/plugins/neo-tree.lua<CR>", { desc = "Reload neo-tree config" })

map("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover Documentation" })
