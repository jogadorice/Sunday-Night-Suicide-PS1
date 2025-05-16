local IntroState = State:extend("IntroState")

function IntroState:enter()

    local Video = {}
    Video.__index = Video

    function Video:new(x, y, path)
        local obj = {
            x = x or 0,
            y = y or 0,
            path = path,
            playing = false,
            canDraw = function()
                return true
            end
        }
        setmetatable(obj, Video)
        return obj
    end

    function Video:play()
        self.playing = true
        self.path:play()
    end

    function Video:stop()
        self.playing = false
        self.path:stop()
    end

    function Video:draw()
        if self.playing then
            love.graphics.setColor(1, 1, 1)
            love.graphics.draw(self.path, self.x, self.y)
        end
    end

    introVideo = Video:new(0, 0, paths.getVideo("ps1_intro"))
    introVideo.x = (love.graphics.getWidth() - introVideo.path:getWidth()) / 2
    introVideo:play()
    self:add(introVideo)

	IntroState.super.enter(self)
end

local videoEnded = false

function IntroState:update(dt)
    if not videoEnded and not introVideo.path:isPlaying() then
        videoEnded = true
        game.switchState(TitleState(), true)
    end
    IntroState.super.update(self, dt)
end

return IntroState
