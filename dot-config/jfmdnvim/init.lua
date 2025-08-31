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

-- Disable unused providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.python3_host_prog = '/home/jose/.nvim-venv/bin/python3'

------------------------------------------------------------------------------------------------------------

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

vim.g.have_nerd_font = true -- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.loaded_netrw = 1 -- nvim-tree recommendation
vim.g.loaded_netrwPlugin = 1 -- nvim-tree recommendation

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
vim.opt.showtabline = 0 -- Disable Tabline on Top, we are using lualine instead
vim.opt.wrap = false -- Disable line wrap/break when text overflows the window.

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true --  See `:help 'list'`
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } --  and `:help 'listchars'`

-- Enable folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.foldlevel = 99 -- Keep folds open when opening files


-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

------------------------------------------------------------------------------------------------------------

--[[ Basic Imports ]]

local helpers = require("helpers")
local fallbacks = require("fallbacks")

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

-- Basic personal keymaps
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Write File" })
vim.keymap.set("n", "<leader>q", "<cmd>qa!<CR>", { desc = "Quit Neovim"})
vim.keymap.set("n", "<C-c>", helpers.bufremove, { desc = "Close Buffer"})
vim.keymap.set("n", "<C-x>", "<cmd>bd<CR>", { desc = "Close Buffer and Window"})
vim.keymap.set("n", "<C-w>n", "<cmd>tabnew %<CR>", { desc = "New Tab"})
vim.keymap.set("n", "<C-w>c", "<cmd>tabclose<CR>", { desc = "Close Tab"})
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keep ; and , functionality when using arrow.nvim for f & t
vim.keymap.set("n", "<C-;>", ";", { noremap = true, silent = true })
vim.keymap.set("n", "<C-,>", ",", { noremap = true, silent = true })

-- My keymaps for cursor always centered
vim.keymap.set("n", "<C-d>", "<C-d>zz^")
vim.keymap.set("n", "<C-u>", "<C-u>zz^")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "<S-n>", "<S-n>zz")
vim.keymap.set("n", "<C-e>", "<C-e>j^")
vim.keymap.set("n", "<C-y>", "<C-y>k^")
vim.keymap.set('n', '<C-f>', function()
  vim.cmd('silent !tmux neww ~/.config/tmux/scripts/tmux-sessionizer.sh')
end, { noremap = true, silent = true })

-- Oil Keymaps
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Oil" })

-- Clipboard Keymaps
vim.keymap.set("n", "<leader>ca", "<cmd>let @+ = expand('%:p')<cr>", { desc = "Copy file [A]bsolute path" })
vim.keymap.set("n", "<leader>cr", "<cmd>let @+ = expand('%:.')<cr>", { desc = "Copy file [R]elative path" })
vim.keymap.set("n", "<leader>cg", function() helpers.copy_relative_path_with_repo_to_clipboard() end, { desc = "Copy file [G]it Relative path" })
vim.keymap.set("n", "<leader>cu", function() helpers.copy_url_to_clipboard() end, { desc = "Copy [G]ithub URL" })
vim.keymap.set("n", "<leader>cp", function() helpers.copy_permalink_to_clipboard() end, { desc = "Copy Github [P]ermalink" })


-- Tab Keymaps
vim.keymap.set("n", "<leader>tq", function() helpers.switch_to_tab(1) end, { desc = "Go to tab 1" })
vim.keymap.set("n", "<leader>tw", function () helpers.switch_to_tab(2) end, { desc = "Go to tab 2" })
vim.keymap.set("n", "<leader>tf", function() helpers.switch_to_tab(3) end, { desc = "Go to tab 3" })

-- Scratch Keymaps
vim.keymap.set("n", "<leader>as", function() helpers.open_scratch() end, { desc = "Generate [S]cratch File" })

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

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("kickstart-diagnostics-keymaps", { clear = true }),
  pattern = "*",
  callback = function()
    if vim.bo.filetype ~= "" then
      vim.keymap.set(
        "n",
        "<leader>ad",
        vim.diagnostic.open_float,
        { desc = "Line Diagnostic", buffer = true }
      )
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("MarkdownConceal", { clear = true }),
  pattern = { "markdown", "md", "mdx" },
  callback = function()
    -- requirement for obsidian.nvim
    vim.opt_local.conceallevel = 1
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

require("lazy").setup({
  spec = { import = "plugins" },
  ui = { icons = vim.g.have_nerd_font and {} or fallbacks.lazy_ui_icons},
  rocks = { enabled = false }
})

------------------------------------------------------------------------------------------------------------

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
