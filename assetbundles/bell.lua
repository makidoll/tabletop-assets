function shallowcopy(orig)
	local orig_type = type(orig)
	local copy
	if orig_type == 'table' then
		copy = {}
		for orig_key, orig_value in pairs(orig) do
			copy[orig_key] = orig_value
		end
	else -- number, string, boolean, etc
		copy = orig
	end
	return copy
end

function ringBell(obj, color)
	self.AssetBundle.playTriggerEffect(0)
end

function onLoad()
	bellTable = {
		click_function = "ringBell",
		function_owner = self,
		label = "Ring!",
		position = {0, 0.5, 0},
		rotation = {0, 0, 0},
		width = 720,
		height  = 720,
		font_size = 100,
		color = {0, 0, 0},
		font_color = {1, 1, 1},
		tooltip = "",
	}

	bellDegrees = {0, 22.5, 45, 67.5}

	for i in pairs(bellDegrees) do
		local button = shallowcopy(bellTable)
		button.rotation = {0, bellDegrees[i], 0}
		self.createButton(button)
	end
end

function onChat(message)
	if (string.lower(message) == "nya") then
		self.AssetBundle.playTriggerEffect(1)
	end
end