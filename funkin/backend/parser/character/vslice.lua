local vslice = {name = "VSlice"}

function vslice.parse(data, name)
	local char = Parser.getDummyChar()

	Parser.pset(char, "sing_duration", data.singTime)
	Parser.pset(char, "flip_x", data.flipX)
	Parser.pset(char, "sprite", data.assetPath)

	local healthIconId = data.healthIcon and data.healthIcon.id or name
	local isPixel = data.healthIcon and data.healthIcon.isPixel or false
	data.healthIcon = {id = healthIconId, isPixel = isPixel}
	Parser.pset(char, "icon", healthIconId .. (isPixel and "-pixel" or ""))
	char.animations = {}

	for _, anim in pairs(data.animations) do
		local name = '' .. anim.name
		if name:endsWith("-hold") then
			name = name:gsub("-hold", "-loop")
		end

		actualAnim = {
			name,
			anim.prefix or '',
			anim.frameIndices or {},
			anim.fps or 24,
			anim.loop == true,
			anim.offsets or {0, 0},
			anim.assetPath
		}

		table.insert(char.animations, actualAnim)
	end

	return char
end

return vslice
