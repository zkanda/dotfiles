hs.loadSpoon("ControlEscape"):start()

-- Configuration
local config = {
	leader = {
		key = { "cmd" },
		trigger = "'",
		timeout = 3,
	},
	apps = {
		T = "Ghostty",
		S = "Slack",
		W = "Google Chrome",
		E = "Cursor",
		N = "Notion",
		F = "Firefox",
		P = "Pycharm",
		M = "Spotify",
	},
}

-- Create leader mode
local leaderMode = hs.hotkey.modal.new(config.leader.key, config.leader.trigger)
local leaderTimer = nil

-- Leader mode functions
local function exitLeaderMode()
	if leaderMode then
		leaderMode:exit()
		if leaderTimer then
			leaderTimer:stop()
		end
	end
end

local function setupLeaderBindings()
	-- Setup exit bindings
	leaderMode:bind({}, "escape", exitLeaderMode)

	-- Setup app shortcuts
	for key, app in pairs(config.apps) do
		leaderMode:bind({}, key, function()
			hs.application.launchOrFocus(app)
			exitLeaderMode()
		end)
	end
end

-- Leader mode callbacks
function leaderMode:entered()
	hs.alert.show("Leader Mode")
	if leaderTimer then
		leaderTimer:stop()
	end
	leaderTimer = hs.timer.doAfter(config.leader.timeout, exitLeaderMode)
end

function leaderMode:exited()
	if leaderTimer then
		leaderTimer:stop()
	end
end

-- Initialize
setupLeaderBindings()
