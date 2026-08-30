-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Use system clipboard with intended commands
vim.keymap.set("v", "<C-S-c>", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set({ "n", "v" }, "<C-S-v>", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("i", "<C-S-v>", "<C-r>+", { desc = "Paste from system clipboard" })

-- Use Control+Backspace to delete a word
map("i", "<C-BS>", "<C-w>")
map("c", "<C-BS>", "<C-w>")
-- map("i", "<C-H>", "<C-w>")
-- map("c", "<C-H>", "<C-w>")

-- Move to window using the <ctrl> hjkl keys
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-l>")
map("n", "<C-S-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-S-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-S-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-S-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Navigate in insert mode
map("i", "<A-h>", "<C-o>h")
map("i", "<A-j>", "<C-o>j")
map("i", "<A-k>", "<C-o>k")
map("i", "<A-l>", "<C-o>l")

map("i", "<C-Left>", "<C-O>b", { desc = "Move back one word in insert mode" })
map("i", "<C-Right>", "<C-O>w", { desc = "Move forward one word in insert mode" })
