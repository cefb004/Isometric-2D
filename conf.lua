function love.conf(t)
    t.identity = "abyss_forge"
    t.version = "11.4"

    t.window.title = "Abyss Forge"
    t.window.width = 800
    t.window.height = 600
    t.window.resizable = false
    t.window.vsync = 1

    -- Desativa módulos desnecessários (performance)
    t.modules.joystick = false
    t.modules.physics  = false
    t.modules.video    = false
    t.modules.touch    = false
end

