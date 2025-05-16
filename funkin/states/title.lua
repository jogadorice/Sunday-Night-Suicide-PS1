local TitleState = State:extend("TitleState")

TitleState.initialized = false

function TitleState:enter()
	shader = Shader("compression")

	util.playMenuMusic(false)

	--game.camera.shader = shader:get()

	local whiteBg = Sprite(0, 0, paths.getImage("menus/title/White_BG"))
	whiteBg.scale:set(1.25,1.25)
	self:add(whiteBg)

	local shadows = Sprite(0, 0, paths.getImage("menus/title/Shadows"))
	shadows.scale:set(1.25,1.25)
	self:add(shadows)

	local mouse = Sprite(220, -120)
	mouse:setFrames(paths.getSparrowAtlas("menus/title/titlechar"))
	mouse:addAnimByPrefix("idle", "idle", 12, true)
	mouse.scale:set(0.415, 0.415)
	mouse:play("idle", true)
	self:add(mouse)

	local logo = Sprite(25, 25)
	logo.scale:set(1.15, 1.15)
	logo:setFrames(paths.getSparrowAtlas("menus/title/PS1LOGO"))
	logo:addAnimByPrefix("idle", "PS1LOGO loop", 24, true)
	logo:play("idle", true)
	self:add(logo)

	startTxt = Sprite(50, game.height - 150, paths.getImage("menus/title/START_GAME"))
	self:add(startTxt)

	TitleState.super.enter(self)
end

function TitleState:update(dt)
	if game.mouse.x >= startTxt.x and game.mouse.x <= startTxt.x + startTxt.width and
		game.mouse.y >= startTxt.y and game.mouse.y <= startTxt.y + startTxt.height then
		if game.mouse.justPressedLeft then
			util.playSfx(paths.getSound("confirm"), 1)
			game.switchState(MainMenuState(), true)
		end
	end

	TitleState.super.update(self, dt)
end

return TitleState
