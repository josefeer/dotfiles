local catppuccin_theme = require("yatline-catppuccin"):setup("mocha") -- or "latte" | "frappe" | "macchiato"

require("full-border"):setup {
	type = ui.Border.ROUNDED,
}

require("yatline"):setup({
	section_separator = { open = "", close = "" },
	part_separator = { open = "", close = "" },
	inverse_separator = { open = "", close = "" },

	theme = catppuccin_theme,

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
