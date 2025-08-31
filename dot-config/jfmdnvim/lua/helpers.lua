---@class helpers
local H = {}

---@param buf number?
function H.bufremove(buf)
  buf = buf or 0
  buf = buf == 0 and vim.api.nvim_get_current_buf() or buf

  if vim.bo.modified then
    local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
    if choice == 0 or choice == 3 then -- 0 for <Esc>/<C-c> and 3 for Cancel
      return
    end
    if choice == 1 then -- Yes
      vim.cmd.write()
    end
  end

  for _, win in ipairs(vim.fn.win_findbuf(buf)) do
    vim.api.nvim_win_call(win, function()
      if not vim.api.nvim_win_is_valid(win) or vim.api.nvim_win_get_buf(win) ~= buf then
        return
      end
      -- Try using alternate buffer
      local alt = vim.fn.bufnr("#")
      if alt ~= buf and vim.fn.buflisted(alt) == 1 then
        vim.api.nvim_win_set_buf(win, alt)
        return
      end

      -- Try using previous buffer
      local has_previous = pcall(vim.cmd, "bprevious")
      if has_previous and buf ~= vim.api.nvim_win_get_buf(win) then
        return
      end

      -- Create new listed buffer
      local new_buf = vim.api.nvim_create_buf(true, false)
      vim.api.nvim_win_set_buf(win, new_buf)
    end)
  end
  if vim.api.nvim_buf_is_valid(buf) then
    pcall(vim.cmd, "bdelete! " .. buf)
  end
end

-- Quick Tab Switch
function H.switch_to_tab(tab_number)
  local tabpages = vim.api.nvim_list_tabpages()
  local current_tab_count = #tabpages

  if tab_number <= current_tab_count then
    vim.api.nvim_set_current_tabpage(tabpages[tab_number])
  else
    vim.cmd('tabnew')
    vim.cmd('tabnext ' .. tab_number)
  end
end

-- Copy file relative path to git repository
local function get_git_root()
  local handle = io.popen('git rev-parse --show-toplevel 2>/dev/null')
  if handle == nil then
    return nil
  end
  local result = handle:read("*a")
  handle:close()
  if result == '' then
    return nil
  else
    return result:gsub('%s+$', '') -- Remove trailing whitespace
  end
end

local function get_remote_url()
  local handle = io.popen('git config --get remote.origin.url 2>/dev/null')
  if handle == nil then
    return nil
  end
  local result = handle:read("*a")
  handle:close()
  if result == '' then
    return nil
  else
    return result:gsub('%s+$', '')
  end
end

local function get_repo_name()
  local remote_url = get_remote_url()
  if not remote_url then
    return nil
  end
  remote_url = remote_url:gsub("%.git$", "") -- Remove .git suffix
  local repo_name = remote_url:match(".*/(.*)$")
  return repo_name
end

local function get_relative_path_with_repo()
  local repo_name = get_repo_name()
  local git_root = get_git_root()
  if not repo_name or not git_root then
    return nil
  end
  local file_path = vim.fn.expand('%:p')
  local relative_path = file_path:sub(#git_root + 2)
  return repo_name .. "/" .. relative_path
end

function H.copy_relative_path_with_repo_to_clipboard()
  local path = get_relative_path_with_repo()
  if not path then
    print("Could not get relative path")
    return
  end
  vim.fn.setreg('+', path)
end

-- Copy github url to clipboard
local function convert_remote_url_to_http(url)
  if url:match("^git@") then
    url = url:gsub(":", "/")
    url = url:gsub("^git@", "https://")
  elseif url:match("^https?://") then
    -- Keep as is
  end
  url = url:gsub("%.git$", "")
  return url
end

local function get_current_branch()
  local handle = io.popen('git rev-parse --abbrev-ref HEAD 2>/dev/null')
  if handle == nil then
    return nil
  end
  local result = handle:read("*a")
  handle:close()
  if result == '' then
    return nil
  else
    return result:gsub('%s+$', '')
  end
end

local function get_file_url()
  local remote_url = get_remote_url()
  if not remote_url then
    return nil
  end
  remote_url = convert_remote_url_to_http(remote_url)
  local branch = get_current_branch()
  if not branch then
    return nil
  end
  local git_root = get_git_root()
  if not git_root then
    return nil
  end
  local file_path = vim.fn.expand('%:p')
  local relative_path = file_path:sub(#git_root + 2)
  local url = remote_url .. "/blob/" .. branch .. "/" .. relative_path
  return url
end

function H.copy_url_to_clipboard()
  local url = get_file_url()
  if not url then
    print("Could not generate file URL")
    return
  end
  vim.fn.setreg('+', url)
end

-- Copy github url permalinks to clipboard
local function get_line_range()
  local mode = vim.fn.mode()
  if mode == 'v' or mode == 'V' or mode == '\22' then
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    if start_line > end_line then
      start_line, end_line = end_line, start_line
    end
    return start_line, end_line
  else
    local line = vim.fn.line('.')
    return line, line
  end
end

local function get_file_url_with_lines()
  local url = get_file_url()
  if not url then
    return nil
  end
  local start_line, end_line = get_line_range()
  if start_line and end_line then
    if start_line == end_line then
      url = url .. "#L" .. start_line
    else
      url = url .. "#L" .. start_line .. "-L" .. end_line
    end
  end
  return url
end

function H.copy_permalink_to_clipboard()
  local url = get_file_url_with_lines()
  if not url then
    print("Could not generate permalink")
    return
  end
  vim.fn.setreg('+', url)
end

function H.open_scratch()
  local filename = vim.fn.input("Scratch filename: ")
  if filename == "" then
    print("No filename entered")
    return
  end

  local dir = "/tmp/jfmdnvim/scratch"
  local path = dir .. "/" .. filename

  -- ensure directory exists
  vim.fn.mkdir(dir, "p")

   -- create file if not exists
  if vim.fn.filereadable(path) == 0 then
    vim.fn.writefile({}, path)
  end

  -- open file in buffer
  vim.cmd("edit " .. vim.fn.fnameescape(path))
end

return H
