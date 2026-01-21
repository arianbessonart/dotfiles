-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Enter adds a new line below and returns to normal mode
vim.keymap.set("n", "<CR>", "o<Esc>", { desc = "Add new line below" })
