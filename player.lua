-- player.lua
local Player = {}
Player.__index = Player

function Player:new(x, y)
    local self = setmetatable({}, Player)

    self.speed = 120 -- pixels por segundo
    self.isMoving = false

    self.x = x or 200
    self.y = y or 200

    self.scale = 3
    self.frameWidth  = 56
    self.frameHeight = 56

    self.directions = { "north", "south", "east", "west" }
    self.animations = {}
    self.currentDirection = "south"

    self.currentFrame = 1
    self.frameTimer = 0
    self.frameDuration = 0.12 -- velocidade da animação

    self:loadAnimations()

    return self
end

function Player:loadAnimations()
    for _, dir in ipairs(self.directions) do
        self.animations[dir] = {}

        for i = 0, 5 do
            local path = string.format(
                "assets/sprites/walk/%s/frame_%03d.png",
                dir,
                i
            )

            table.insert(self.animations[dir], love.graphics.newImage(path))
        end
    end
end

function Player:update(dt)
    self.frameTimer = self.frameTimer + dt

    if self.isMoving then
        self.frameTimer = self.frameTimer + dt

        if self.frameTimer >= self.frameDuration then
            self.frameTimer = self.frameTimer - self.frameDuration
            self.currentFrame = self.currentFrame + 1

            if self.currentFrame > #self.animations[self.currentDirection] then
                self.currentFrame = 1
            end
        end
    else
        self.currentFrame = 1
        self.frameTimer = 0
    end


    if self.frameTimer >= self.frameDuration then
        self.frameTimer = self.frameTimer - self.frameDuration
        self.currentFrame = self.currentFrame + 1

        if self.currentFrame > #self.animations[self.currentDirection] then
            self.currentFrame = 1
        end
    end
end

function Player:setDirection(direction)
    if self.currentDirection ~= direction then
        self.currentDirection = direction
        self.currentFrame = 1
        self.frameTimer = 0
    end
end

function Player:move(dx, dy, dt)
    self.x = self.x + dx * self.speed * dt
    self.y = self.y + dy * self.speed * dt
end


function Player:draw()
    local image = self.animations[self.currentDirection][self.currentFrame]

    love.graphics.draw(
        image,
        self.x,
        self.y,
        0,
        self.scale,
        self.scale,
        self.frameWidth / 2,
        self.frameHeight / 2
    )
end

return Player

