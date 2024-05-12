-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Disable LazyVim Default Keymaps
vim.keymap.del("n", "<leader>`")

vim.keymap.del("n", "<leader>-")
vim.keymap.del("n", "<leader>|")

vim.keymap.del("n", "<leader>l")
vim.keymap.del("n", "<leader>L")

vim.keymap.del("n", "<leader>fb")
vim.keymap.del("n", "<leader>fc")
vim.keymap.del("n", "<leader>ff")
vim.keymap.del("n", "<leader>fF")
vim.keymap.del("n", "<leader>fg")
vim.keymap.del("n", "<leader>fn")
vim.keymap.del("n", "<leader>fr")
vim.keymap.del("n", "<leader>fR")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>ft")

vim.keymap.del("n", "<leader>K")

vim.keymap.del("n", "<leader>gG")
vim.keymap.del("n", "<leader>bb")

vim.keymap.del("n", "<leader>sG")
vim.keymap.del("n", "<leader>sR")
vim.keymap.del("n", "<leader>sS")
vim.keymap.del("n", "<leader>sW")

vim.keymap.del("n", "<leader>uL")
vim.keymap.del("n", "<leader>ul")
vim.keymap.del("n", "<leader>us")

vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")

-- Primeagen Keymaps
vim.keymap.set("n", "<C-d>", "<C-d>zz^")
vim.keymap.set("n", "<C-u>", "<C-u>zz^")

-- My keymaps for cursor always centered
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "<S-n>", "<S-n>zz")
vim.keymap.set("n", "[g", "[gzz")
vim.keymap.set("n", "]g", "]gzz")
vim.keymap.set("n", "[f", "[fzz")
vim.keymap.set("n", "]f", "]fzz")

vim.keymap.set("n", "<C-e>", "<C-e>j^")
vim.keymap.set("n", "<C-y>", "<C-y>k^")

-- My which-key Keymaps
vim.keymap.set("n", "<leader>sf", LazyVim.telescope("files"), { desc = "Files" })
vim.keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent" })


-- My Keymaps for LazyTerm
local Util = require("lazyvim.util")

-- Tmux
vim.keymap.set("n", "<C-_>", function()
  Util.terminal(nil, { border = "rounded" })
end, { desc = "Term with border" })

-- Standalone Terminal
vim.keymap.set("n", "<C-/>", function()
  Util.terminal(nil, { border = "rounded" })
end, { desc = "Term with border" })

vim.keymap.set("t", "<C-l>", "clear<cr>")

-- Harpoon Keymaps
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

-- stylua: ignore start
vim.keymap.set("n", "<leader>h", function () end, { desc = "Harpoon" })
vim.keymap.set("n", "<leader>hn", function() harpoon:list():add() end, { desc = "Harpoon Add New" })
vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon List" })

vim.keymap.set("n", "<leader>ha", function() harpoon:list():select(1) end, { desc = "Harpoon Buffer 1" })
vim.keymap.set("n", "<leader>hs", function() harpoon:list():select(2) end, { desc = "Harpoon Buffer 3" })
vim.keymap.set("n", "<leader>hd", function() harpoon:list():select(3) end, { desc = "Harpoon Buffer 3" })
vim.keymap.set("n", "<leader>hf", function() harpoon:list():select(4) end, { desc = "Harpoon Buffer 4" })
vim.keymap.set("n", "<leader>hg", function() harpoon:list():select(5) end, { desc = "Harpoon Buffer 5" })
