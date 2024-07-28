-- https://wezfurlong.org/wezterm/index.html

local wezterm = require("wezterm")

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

wezterm.on("format-tab-title", function(tab, _, _, _, hover, max_width)
	local edge_background = "#0b0022"
	local background = "#1b1032"
	local foreground = "#808080"

	if tab.is_active then
		background = "#2b2042"
		foreground = "#c0c0c0"
	elseif hover then
		background = "#3b3052"
		foreground = "#909090"
	end

	local edge_foreground = background

	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	local title = wezterm.truncate_right(tab.active_pane.title, max_width - 2)

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

-- KEY MAPPING SECTION

local act = wezterm.action
local key_maps = {
	{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{
		key = "|",
		mods = "ALT|SHIFT",
		action = act.SplitHorizontal({
			domain = "CurrentPaneDomain",
		}),
	},
	{
		key = "_",
		mods = "ALT|SHIFT",
		action = act.SplitVertical({
			domain = "CurrentPaneDomain",
		}),
	},
	{
		key = "x",
		mods = "LEADER",
		action = act({
			CloseCurrentPane = {
				confirm = true,
			},
		}),
	},

	-- Tmux like Pane navigation
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },

	-- Debugging
	{ key = "L", mods = "CTRL", action = wezterm.action.ShowDebugOverlay },

	-- Disable default tab navigation for nvim
	{ key = "Tab", mods = "CTRL", action = act.DisableDefaultAssignment },
	{ key = "Tab", mods = "SHIFT|CTRL", action = act.DisableDefaultAssignment },

	-- Zen mode
	{ key = "Z", mods = "CTRL", action = wezterm.action.TogglePaneZoomState },
}

-- Window switching mapping
for i = 1, 8 do
	-- CTRL+ALT + number to activate that tab
	table.insert(key_maps, {
		key = tostring(i),
		mods = "CTRL|ALT",
		action = act.ActivateTab(i - 1),
	})
	-- F1 through F8 to activate that tab
	table.insert(key_maps, {
		key = "F" .. tostring(i),
		action = act.ActivateTab(i - 1),
	})
end

return {
	-- KEYS
	leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1500 },
	keys = key_maps,

	-- STYLES
	window_background_opacity = 0.95,
	color_scheme = "Dracula",
	enable_wayland = true,

	-- FONTS
	font = wezterm.font_with_fallback({
		{ family = "MesloLGS Nerd Font Mono" },
		{ family = "JetbrainsMono Nerd Font" },
		{ family = "Hack Nerd Font Mono" },
		{ family = "FiraCode" },
		{ family = "Cascadia Code" },
		{ family = "Operator Mono Lig Book", weight = 325, italic = true },
	}),
	-- Font size is used to determine zoom level
	font_size = 13.5,

	-- Appearance
	hide_tab_bar_if_only_one_tab = true,
	enable_scroll_bar = true,
}
