-- =========================
-- CONFIG
-- =========================
local SCALE = 4
local FRAME_WIDTH  = 64
local FRAME_HEIGHT = 96
local WALK_FRAMES  = 4
local FRAME_TIME   = 0.12

-- =========================
-- PLAYER
-- =========================
local player = {
    x = 200,
    y = 200,
    speed = 120,
    direction = "down",
    moving = false
}

-- =========================
-- ANIMATION
-- =========================
local sprite
local animations = {}
local currentFrame = 1
local timer = 0

-- Direções → linhas do spritesheet
local directions = {
    right = 1,  -- 1ª linha
    left  = 2,  -- 2ª linha
    up    = 3,  -- 3ª linha
    down  = 3   -- 4ª linha
}

-- =========================
-- LOAD
-- =========================
function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")

    sprite = love.graphics.newImage("assets/sprites/barbarian_walk.png")

    -- Criação dos quads
    for dir, row in pairs(directions) do
        animations[dir] = {}

        for col = 1, WALK_FRAMES do
            local quad = love.graphics.newQuad(
                (col - 1) * FRAME_WIDTH,
                (row - 1) * FRAME_HEIGHT,
                FRAME_WIDTH,
                FRAME_HEIGHT,
                sprite:getDimensions()
            )
            table.insert(animations[dir], quad)
        end
    end
end

-- =========================
-- UPDATE
-- =========================
function love.update(dt)
    player.moving = false

    -- Movimento
    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed * dt
        player.direction = "right"
        player.moving = true
    elseif love.keyboard.isDown("left") then
        player.x = player.x - player.speed * dt
        player.direction = "left"
        player.moving = true
    elseif love.keyboard.isDown("up") then
        player.y = player.y - player.speed * dt
        player.direction = "up"
        player.moving = true
    elseif love.keyboard.isDown("down") then
        player.y = player.y + player.speed * dt
        player.direction = "down"
        player.moving = true
    end

    -- Animação
    if player.moving then
        timer = timer + dt
        if timer >= FRAME_TIME then
            timer = 0
            currentFrame = currentFrame + 1
            if currentFrame > WALK_FRAMES then
                currentFrame = 1
            end
        end
    else
        currentFrame = 1 -- parado = primeiro frame
        timer = 0
    end
end

-- =========================
-- DRAW
-- =========================
function love.draw()
    love.graphics.draw(
        sprite,
        animations[player.direction][currentFrame],
        player.x,
        player.y,
        0,
        SCALE,
        SCALE,
        FRAME_WIDTH / 2,
        FRAME_HEIGHT
    )
end

