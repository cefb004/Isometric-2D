-- =========================
-- CONFIG
-- =========================
local SCALE = 4
local FRAME_WIDTH  = 64
local FRAME_HEIGHT = 96

local WALK_FRAMES   = 4
local ATTACK_FRAMES = 4

local FRAME_TIME_WALK   = 0.12
local FRAME_TIME_ATTACK = 0.10

-- =========================
-- PLAYER
-- =========================
local player = {
    x = 200,
    y = 200,
    speed = 120,
    direction = "down",
    moving = false,
    state = "walk" -- walk | attack
}

-- =========================
-- ANIMATION
-- =========================
local sprites = {}
local animations = {}

local currentFrame = 1
local timer = 0

-- Direções → linhas do spritesheet (4x4)
local directions = {
    right = 1,
    left  = 2,
    up    = 3,
    down  = 3
}

-- =========================
-- LOAD
-- =========================
function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")

    sprites.walk   = love.graphics.newImage("assets/sprites/barbarian_walk.png")
    sprites.attack = love.graphics.newImage("assets/sprites/barbarian_attack.png")

    animations.walk = {}
    animations.attack = {}

    -- WALK
    for dir, row in pairs(directions) do
        animations.walk[dir] = {}

        for col = 1, WALK_FRAMES do
            table.insert(
                animations.walk[dir],
                love.graphics.newQuad(
                    (col - 1) * FRAME_WIDTH,
                    (row - 1) * FRAME_HEIGHT,
                    FRAME_WIDTH,
                    FRAME_HEIGHT,
                    sprites.walk:getDimensions()
                )
            )
        end
    end

    -- ATTACK
    for dir, row in pairs(directions) do
        animations.attack[dir] = {}

        for col = 1, ATTACK_FRAMES do
            table.insert(
                animations.attack[dir],
                love.graphics.newQuad(
                    (col - 1) * FRAME_WIDTH,
                    (row - 1) * FRAME_HEIGHT,
                    FRAME_WIDTH,
                    FRAME_HEIGHT,
                    sprites.attack:getDimensions()
                )
            )
        end
    end
end

-- =========================
-- UPDATE
-- =========================
function love.update(dt)
    player.moving = false

    -- =========================
    -- INPUT ATTACK
    -- =========================
    if love.keyboard.isDown("space") and player.state ~= "attack" then
        player.state = "attack"
        currentFrame = 1
        timer = 0
    end

    -- =========================
    -- MOVEMENT (only if walking)
    -- =========================
    if player.state == "walk" then
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
    end

    -- =========================
    -- ANIMATION UPDATE
    -- =========================
    timer = timer + dt

    if player.state == "walk" then
        if player.moving then
            if timer >= FRAME_TIME_WALK then
                timer = 0
                currentFrame = currentFrame + 1
                if currentFrame > WALK_FRAMES then
                    currentFrame = 1
                end
            end
        else
            currentFrame = 1
            timer = 0
        end

    elseif player.state == "attack" then
        if timer >= FRAME_TIME_ATTACK then
            timer = 0
            currentFrame = currentFrame + 1

            if currentFrame > ATTACK_FRAMES then
                -- termina ataque
                currentFrame = 1
                player.state = "walk"
            end
        end
    end
end

-- =========================
-- DRAW
-- =========================
function love.draw()
    local sprite = sprites[player.state]
    local quad   = animations[player.state][player.direction][currentFrame]

    love.graphics.draw(
        sprite,
        quad,
        player.x,
        player.y,
        0,
        SCALE,
        SCALE,
        FRAME_WIDTH / 2,
        FRAME_HEIGHT
    )
end

