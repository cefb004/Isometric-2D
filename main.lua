local Player

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")

    Player = require("player"):new(400, 300)
end

function love.update(dt)
    local dx, dy = 0, 0
    Player.isMoving = false

    -- Vertical
    if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
        dy = -1
        Player:setDirection("north")
        Player.isMoving = true
    elseif love.keyboard.isDown("s") or love.keyboard.isDown("down") then
        dy = 1
        Player:setDirection("south")
        Player.isMoving = true
    end

    -- Horizontal
    if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
        dx = -1
        Player:setDirection("west")
        Player.isMoving = true
    elseif love.keyboard.isDown("d") or love.keyboard.isDown("right") then
        dx = 1
        Player:setDirection("east")
        Player.isMoving = true
    end

    if Player.isMoving then
        Player:move(dx, dy, dt)
    end

    Player:update(dt)
end

function love.draw()
    Player:draw()
end
