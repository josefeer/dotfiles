--[[

  TBD

--]]

local function is_darwin()
  local value = vim.fn.has("macunix")
  return not not value -- lua casting bools lol
end

local function get_obsidian_workspaces(path)
  local expanded_path = vim.fn.expand(path)

  local stat = vim.loop.fs_stat(expanded_path)
  if not stat or stat.type ~= "directory" then
    return {}
  end

  -- Initialize the scandir handle
  local handle, err = vim.loop.fs_scandir(expanded_path)
  if not handle then
    vim.api.nvim_err_writeln("Error scanning directory: " .. (err or "unknown error"))
    return {}
  end

  local directories = {}

  while true do
    local name, type = vim.loop.fs_scandir_next(handle)
    if not name then
      break
    end

    if type == "directory" then
      local full_path = expanded_path .. "/" .. name

      table.insert(directories, {
        name = name,
        path = full_path,
      })
    end
  end

  return directories
end

local obsidian_workspaces_path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents"

return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  enabled = is_darwin(),
  event = {
    --   -- refer to `:h file-pattern` for more examples
    "BufReadPre " .. vim.fn.expand(obsidian_workspaces_path) .. "/**/*.md",
    "BufNewFile " .. vim.fn.expand(obsidian_workspaces_path) .. "/**/*.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = get_obsidian_workspaces(obsidian_workspaces_path)
  },
}
