local function module_exists(name)
    return package.searchpath(name, package.path) ~= nil
end

local function safe_require(name)
    if module_exists(name) then
        local status, result = pcall(require, name)
        if status then
            return result
        else
            print("Error loading module '" .. name .. "': " .. result)
            return nil
        end
    else
        print("Module '" .. name .. "' not found in package.path.")
        return nil
    end
end

local plugins = {
    {
        name = "full-border",
        config = function()
            require("full-border"):setup({
		type = ui.Border.ROUNDED,
            })
        end,
    },
    {
        name = "yatline",
	config = function ()
            require("yatline"):setup({
		section_separator = { open = "", close = "" },
		part_separator = { open = "", close = "" },
		inverse_separator = { open = "", close = "" },

		tab_width = 20,
		tab_use_inverse = false,

		selected = { icon = "󰻭", fg = "yellow" },
		copied = { icon = "", fg = "green" },
		cut = { icon = "", fg = "red" },

		total = { icon = "󰮍", fg = "yellow" },
		succ = { icon = "", fg = "green" },
		fail = { icon = "", fg = "red" },
		found = { icon = "󰮕", fg = "blue" },
		processed = { icon = "󰐍", fg = "green" },

		show_background = true,

		display_header_line = true,
		display_status_line = true,

		header_line = {
			left = {
				section_a = {
					{type = "line", custom = false, name = "tabs", params = {"left"}},
				},
				section_b = {
				},
				section_c = {
				}
			},
			right = {
				section_a = {
					{type = "string", custom = false, name = "date", params = {"%A, %d %B %Y"}},
				},
				section_b = {
					{type = "string", custom = false, name = "date", params = {"%X"}},
				},
				section_c = {
				}
			}
		},

		status_line = {
			left = {
				section_a = {
					{type = "string", custom = false, name = "tab_mode"},
				},
				section_b = {
					{type = "string", custom = false, name = "hovered_size"},
				},
				section_c = {
					{type = "string", custom = false, name = "hovered_name"},
					{type = "coloreds", custom = false, name = "count"},
				}
			},
			right = {
				section_a = {
					{type = "string", custom = false, name = "cursor_position"},
				},
				section_b = {
					{type = "string", custom = false, name = "cursor_percentage"},
				},
				section_c = {
					{type = "string", custom = false, name = "hovered_file_extension", params = {true}},
					{type = "coloreds", custom = false, name = "permissions"},
				}
			}
		},
	})
	end
    },
}

for _, plugin in ipairs(plugins) do
    local mod = safe_require(plugin.name)
    if mod then
        if plugin.config and type(plugin.config) == "function" then
            plugin.config()
        elseif type(mod.setup) == "function" then
            mod.setup()
        elseif type(mod.initialize) == "function" then
            mod.initialize()
        else
            print("No setup or initialize function found for module: " .. plugin.name)
        end
    end
end
