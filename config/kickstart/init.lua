--[[
  References
  - https://github.com/nvim-lua/kickstart.nvim
  - https://learnxinyminutes.com/docs/lua/
  - https://neovim.io/doc/user/lua-guide.html
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

------------------------------------------------------------------------------------------------------------

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

vim.g.have_nerd_font = true -- Set to true if you have a Nerd Font installed and selected in the terminal
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false -- Don't show the mode, since it's already in the status line
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300 -- Decrease mapped sequence wait time. Displays which-key popup sooner.
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split" -- Preview substitutions live, as you type!
vim.opt.cursorline = true
vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true --  See `:help 'list'`
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } --  and `:help 'listchars'`

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

------------------------------------------------------------------------------------------------------------

--[[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

--  Keybinds to make split navigation easier.
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Personal Keybinds
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Write File" })
vim.keymap.set("n", "<leader>Q", "<cmd>qa<CR>", { desc = "Quit All"})

------------------------------------------------------------------------------------------------------------

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

------------------------------------------------------------------------------------------------------------

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

------------------------------------------------------------------------------------------------------------

-- [[ Configure and install plugins ]]

--  To check the current status of your plugins, run
--    :Lazy

--  You can press `?` in this menu for help. Use `:q` to close the window

--  To update plugins you can run
--    :Lazy update

local lazy_ui_fallback = {
  cmd = "⌘",
  config = "🛠",
  event = "📅",
  ft = "📂",
  init = "⚙",
  keys = "🗝",
  plugin = "🔌",
  runtime = "💻",
  require = "🌙",
  source = "📄",
  start = "🚀",
  task = "📌",
  lazy = "💤 ",
}

require("lazy").setup({
  spec = { import = "plugins" },
  ui = { icons = vim.g.have_nerd_font and {} or lazy_ui_fallback },
})

------------------------------------------------------------------------------------------------------------

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
