local wezterm = require 'wezterm'

local act = wezterm.action

local config = {

	-- front_end = "WebGpu",

	-- Window Config
	window_padding = {
		left = 5,
		right = 5,
		top = 5,
		bottom = 5,
	},
	window_background_opacity = 0.85,
	window_close_confirmation = "NeverPrompt",

	-- Font Config
	font = wezterm.font('Fira Code SemiBold', { weight = "DemiBold" }),
	font_size = 16.0,

	-- Color Style
	colors = {
		foreground = "#c4c4b5",
		background = "#0f0f0f",

		cursor_bg = "#f6f6ec",
		cursor_fg = "#f6f6ec",

		selection_fg = "#262525",
		selection_bg = "#9c64fe",

		ansi = {
			"#191919",
			"#f3005f",
			"#97e023",
			"#f2f200",
			"#9c64fe",
			"#f3005f",
			"#57d1ea",
			"#c4c4b5",
		},

		brights = {
			"#191919",
			"#f3005f",
			"#97e023",
			"#f2f200",
			"#9c64fe",
			"#f3005f",
			"#57d1ea",
			"#c4c4b5"
		},

	},

	-- Cursor
	cursor_thickness = 3,
	default_cursor_style = 'SteadyBar',

	-- Keybindings
	keys = {
		{
			key = "w",
			mods = "CTRL|ALT",
			action = act.CloseCurrentTab { confirm = false },
		},
		{
			key = "t",
			mods = "CTRL",
			action = act.SpawnTab "CurrentPaneDomain"
		}
	}
}

for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = 'ALT',
		action = act.ActivateTab(i - 1),
	})
end

return config
