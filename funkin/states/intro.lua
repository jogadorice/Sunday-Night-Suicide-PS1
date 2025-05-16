local IntroState = State:extend("IntroState")

function IntroState:enter()

    love.mouse.setVisible(true)

    introVideo = Video(0, 0, "ps1_intro")
    introVideo.x = game.width / 2 - introVideo.width / 2
    introVideo:play()
    introVideo.onComplete = function()
        game.switchState(TitleState(), true)
    end
    self:add(introVideo)

	IntroState.super.enter(self)
end

function IntroState:update(dt)
    if controls:pressed("accept") then
        --introVideo:stop()
        game.switchState(TitleState(), true)
    end

    IntroState.super.update(self, dt)
end

return IntroState
