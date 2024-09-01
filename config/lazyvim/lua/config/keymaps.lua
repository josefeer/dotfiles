-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Disable LazyVim Default Keymaps
vim.keymap.del("n", "<leader>`")

vim.keymap.del("n", "<leader>-")
vim.keymap.del("n", "<leader>|")

vim.keymap.del("n", "<leader>l")
vim.keymap.del("n", "<leader>L")

vim.keymap.del("n", "<leader>fn")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>ft")

vim.keymap.del("n", "<leader>K")

vim.keymap.del("n", "<leader>gG")
vim.keymap.del("n", "<leader>bb")

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

vim.keymap.set("n", "<C-e>", "<C-e>j^")
vim.keymap.set("n", "<C-y>", "<C-y>k^")

-- My which-key Keymaps
local wk = require("which-key")
wk.add({
  { "<leader>sf", LazyVim.pick("files"), icon = "", desc = "Files" },
  { "<leader>sO", "<cmd>Telescope oldfiles<cr>", icon = "", desc = "Oldfiles" },
  { "<leader>sb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", icon = "", desc = "Buffers" },
  { "<leader>sr", "<cmd>Telescope pickers<cr>", icon = "", desc = "Recent Search" },
})

vim.keymap.set("n", "<leader>ba", "<cmd>bd|e#", { desc = "Delete All Buffers but Current" })

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

wk.add({
  { "<leader>n", icon = "󱐋", group = "harpoon" },
  { "<leader>nn", function() harpoon:list():add() end,icon = "󱐋", desc = "harpoon add new" },
  { "<leader>nl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, icon = "󱐋", desc = "harpoon list" },
  { "<leader>na", function() harpoon:list():select(1) end, icon = "󱐋", desc = "harpoon bookmark 1" },
  { "<leader>nr", function() harpoon:list():select(2) end, icon = "󱐋", desc = "harpoon bookmark 2" },
  { "<leader>ns", function() harpoon:list():select(3) end, icon = "󱐋", desc = "harpoon bookmark 3" },
  { "<leader>nt", function() harpoon:list():select(4) end, icon = "󱐋", desc = "harpoon bookmark 4" },
  { "<leader>ng", function() harpoon:list():select(5) end, icon = "󱐋", desc = "harpoon bookmark 5" },
})

-- Octo Keymaps
wk.add(
  {
    { "<leader>o", icon = "", group = "Octo" },
    { "<leader>ol", "<cmd>Octo pr list<CR>", icon = "", desc = "List PRs" },
    { "<leader>os", "<cmd>Octo pr search<CR>", icon = "", desc = "Search PRs" },
    { "<leader>oc", icon= "", group = "Comment/Code", mode = {"n", "v"} },
    { "<leader>oca", "<cmd>Octo comment add<CR>", icon = "", desc = "Add a new comment", mode = {"n", "v"} },
    { "<leader>ocd", "<cmd>Octo comment delete<CR>", icon = "", desc = "Delete a comment", mode = {"n", "v"} },
    { "<leader>op", icon= "", group = "Pull Request" },
    { "<leader>opc", "<cmd>Octo pr checkout<CR>", icon = "", desc = "Checkout PR" },
    { "<leader>opf", "<cmd>Octo pr changes", icon = "", desc = "List PR Chaged files" },
    { "<leader>opl", "<cmd>Octo pr commits<CR>", icon = "", desc = "List PR commits" },
    { "<leader>opd", "<cmd>Octo pr diff<CR>", icon = "", desc = "Show PR diff" },
    { "<leader>opu", "<cmd>Octo pr url<CR>", icon = "", desc = "Copy PR url to clipboard" },
    { "<leader>or", icon= "", group = "Review" },
    { "<leader>ora", "<cmd>Octo reviewer add<CR>", icon = "", desc = "Assign a PR reviewer" },
    { "<leader>ors", "<cmd>Octo review start<CR>", icon = "", desc = "Start a new review" },
    { "<leader>ort", "<cmd>Octo review submit<CR>", icon = "", desc = "Submit the review" },
    { "<leader>orr", "<cmd>Octo review resume<CR>", icon = "", desc = "Edit a pending review for current PR" },
    { "<leader>ord", "<cmd>Octo review discard<CR>", icon = "", desc = "Deletes a pending review for current PR if any" },
    { "<leader>oro", "<cmd>Octo review comments<CR>", icon = "", desc = "View pending review comments" },
    { "<leader>orm", "<cmd>Octo review commit<CR>", icon = "", desc = "Pick a specific commit to review" },
    { "<leader>orc", "<cmd>Octo review close<CR>", icon = "", desc = "Close the review window and return to the PR" },
  }
)
