-- Dear programmer:
-- When I wrote this code, only god and
-- I knew how it worked.
-- Now, only god knows it!
-- Therefore, if you are trying to optimize
-- this and you fail (most surely),
-- please increase this counter as a
-- warning for the next person:
-- total hours wasted here = 0



-- WHAT
push = require "push"
Class = require 'Class'


-- imports
require 'alien' -- alien.lua
require 'player' -- player.lua
require 'boss' -- boss.lua
require 'wave' -- wave.lua
require 'alienattack' --alienattack.lua

-- store click pos
clickpos = {
	x = 0,
	y = 0
}

points = 0 -- score


-- just the window info
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720
VIRTUAL_WIDTH = WINDOW_WIDTH
VIRTUAL_HEIGHT = WINDOW_HEIGHT


-- load bg
Background = love.graphics.newImage("sprites/Background.png")

-- init user class
user = player(700,WINDOW_HEIGHT-50,0)


-- init wave
wave1 = wave(1)

function love.load()
	love.graphics.setDefaultFilter('nearest', 'nearest')

	love.window.setTitle('Space Invaders') -- set window title

	--set resolution
	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false,
		vsync = false -- ew vsync never
	})

end

function love.mousepressed(x, y, button, istouch)
	if button == 1 then -- Versions prior to 0.10.0 use the MouseConstant 'l'
	   clickpos["x"] = x
	   clickpos["y"] = y
	end
 end


function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	elseif key == 'left' then
		user.dx = user.dx -5
	elseif key == 'right' then
		user.dx =  user.dx + 5
	elseif key == 'space' then
		user:fire()
	end
end


-- redef draw?
function love.draw()
	push:apply('start')

	love.graphics.setFont(love.graphics.newFont('Press-Start-2P.ttf', 30))

	love.graphics.clear(0.1, 0.11, 0.14, 1)
	
	
    love.graphics.draw(Background, 0, 0)

	user:render()

	wave1:render()
	wave1:check()
	
	displayFPS()
	displayPoints()

	push:apply('end')
end


-- FPS renderer
function displayFPS()
	love.graphics.setFont(love.graphics.newFont('Press-Start-2P.ttf', 20)) -- set font
	love.graphics.setDefaultFilter('linear', 'linear') -- the heck

	-- decide color
	if love.timer.getFPS() < 30 then
		love.graphics.setColor(240, 252, 3, 1)
	elseif love.timer.getFPS() < 60  and love.timer.getFPS() > 30 then
		love.graphics.setColor(0, 1, 0, 1)
	else
		love.graphics.setColor(255, 0, 0, 1)
	end

	-- print it
	love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 20, WINDOW_HEIGHT - 50)
end

-- point renderer
function displayPoints()
	love.graphics.setFont(love.graphics.newFont('Press-Start-2P.ttf', 15))
	love.graphics.setDefaultFilter('linear', 'linear')
	love.graphics.setColor(1,1,1, 1)	
	love.graphics.print(tostring(points), 20, 20)
end