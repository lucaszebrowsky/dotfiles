local wezterm = require 'wezterm'

local act = wezterm.action
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

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

	-- Tab config
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
	show_new_tab_button_in_tab_bar = false,
	tab_max_width = 32,

	-- Font Config
	font = wezterm.font('Fira Code SemiBold', { weight = "DemiBold" }),
	font_size = 16.0,

	-- Color Style
	colors = {
		tab_bar = {
			background = "rgba(0,0,0,0)"
		},

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
			"#615e4b",
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

local function tab_title(tab_info)
	local title = tab_info.tab_title
	if title and #title > 0 then
		return title
	end
	return tab_info.active_pane.title
end

wezterm.on(
	'format-tab-title',
	function(tab, tabs, panes, config, hover, max_width)
		local active_background = "#3e4452"
		local active_foreground = "#aab2bf"
		local inactive_background = "#282c34"
		local inactive_foreground = "#aab2bf"
		local transparent = "rgba(0,0,0,0)"
		local title = tab_title(tab)
		local index = tab.tab_index + 1
		local isFirst = index == 1
		local isLast = index == #tabs and #tabs ~= 0
		title = wezterm.truncate_right(title, max_width - 2)

		local items = {}

		if tab.is_active then
			table.insert(items, { Background = { Color = active_background } })
			table.insert(items, { Foreground = { Color = active_foreground } })
			table.insert(items, { Text = " " .. index .. "  " .. title .. " " })

			if isFirst then
				if #tabs > 1 then
					table.insert(items, { Background = { Color = inactive_background } })
					table.insert(items, { Foreground = { Color = active_background } })
				else
					table.insert(items, { Background = { Color = transparent } })
					table.insert(items, { Foreground = { Color = active_background } })
				end
			end

			if isLast then
				table.insert(items, { Background = { Color = transparent } })
				table.insert(items, { Foreground = { Color = active_background } })
			else
				table.insert(items, { Background = { Color = inactive_background } })
				table.insert(items, { Foreground = { Color = active_background } })
			end

			table.insert(items, { Text = SOLID_RIGHT_ARROW })
		else
			table.insert(items, { Background = { Color = active_background } })
			table.insert(items, { Foreground = { Color = active_foreground } })
			table.insert(items, { Background = { Color = inactive_background } })
			table.insert(items, { Foreground = { Color = inactive_foreground } })
			table.insert(items, { Text = " " .. index .. "  " .. title .. " " })

			if isLast then
				table.insert(items, { Background = { Color = transparent } })
				table.insert(items, { Foreground = { Color = inactive_background } })
			else
				-- Check if the next tab is active
				if index - 1 < #tabs then
					local nextTab = tabs[index + 1]
					if nextTab.is_active then
						table.insert(items, { Background = { Color = active_background } })
						table.insert(items, { Foreground = { Color = inactive_background } })
					else
						table.insert(items, { Background = { Color = inactive_background } })
						table.insert(items, { Foreground = { Color = inactive_background } })
					end
					-- else
					-- table.insert(items, { Background = { Color = inactive_background } })
					-- table.insert(items, { Foreground = { Color = active_background } })
				end
			end
			table.insert(items, { Text = SOLID_RIGHT_ARROW })
		end

		return items
	end
)

return config
