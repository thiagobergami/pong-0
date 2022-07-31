push = require 'push'

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

-- This function will load our preset configuration
function love.load()
    WINDOW_WIDTH = 1280
    WINDOW_HEIGHT = 720
    
    -- use nearest-neighbor filtering on upscaling and downscaling to prevent blurring of text
    love.graphics.setDefaultFilter('nearest', 'nearest')

    font = love.graphics.newFont('font.ttf', 8)

    love.graphics.setFont(font)


    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

function love.keypressed(key)

    if key == 'escape' then
        love.event.quit()
    end
end

function love.draw()
    push:apply('start')

    -- Apllyng the original Pong color to the canva
    love.graphics.clear(40/255, 45/255, 52/255, 255/255)

    love.graphics.printf('Hello Pong!', 0, 20, VIRTUAL_WIDTH, 'center')
    
    --starting the paddles

    -- left side paddle
    love.graphics.rectangle('fill', 10, 30, 5, 20)

    --rigth side paddle
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 50, 5, 20)

    -- render ball (center)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)

    push:apply('end')
end

