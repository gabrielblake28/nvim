-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Automatically cd into the project root detected by LazyVim

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local root = require("lazyvim.util").root()
    if root and root ~= vim.fn.getcwd() then
      vim.cmd("cd " .. root)
    end
  end,
})
