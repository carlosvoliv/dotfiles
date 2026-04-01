-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Aperte <Leader>w para ligar/desligar o wrap
vim.keymap.set("n", "<leader>w", "<cmd>set wrap!<CR>", { desc = "Toggle Word Wrap" })
