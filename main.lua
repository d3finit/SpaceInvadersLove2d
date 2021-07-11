push = require "push"
Class = require 'Class'

require 'alien'
require 'player'
require 'boss'
require 'wave'



clicky = 0
clickx = 0

state = "start"
points = 0
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720
VIRTUAL_WIDTH = WINDOW_WIDTH
VIRTUAL_HEIGHT = WINDOW_HEIGHT


user = player(600,WINDOW_HEIGHT-50,0)
boss1 = boss(600,400)


wave1bosses = {
	boss(600,100)
}
wave1bosses = {
	alien(200,200),
	alien(300,200),
	alien(400,200),
	alien(500,200),
	alien(600,200),
	alien(700,200),
	alien(800,200),
	alien(900,200),
	alien(1000,200),
	alien(1100,200),

	alien(200,300),
	alien(300,300),
	alien(400,300),
	alien(500,300),
	alien(600,300),
	alien(700,300),
	alien(800,300),
	alien(900,300),
	alien(1000,300),
	alien(1100,300)
}

wave1 = wave("1",aliens,bosses)

function love.load()
	love.graphics.setDefaultFilter('nearest', 'nearest')

	love.window.setTitle('Space Invaders') -- set window title

	font = love.graphics.newFont('font.ttf', 30) -- configure fonts
	FPSFont = love.graphics.newFont('font.ttf', 20)
	PointsFont = love.graphics.newFont('font.ttf', 15)
	love.graphics.setFont(font)

	--set resolution
	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false,
		vsync = true
	})

end

function love.mousepressed(x, y, button, istouch)
	if button == 1 then -- Versions prior to 0.10.0 use the MouseConstant 'l'
	   clickx = x
	   clicky = y
	end
 end

function love.keypressed(key)
	-- print(key)
	--access keys by string name
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

function love.draw()
	push:apply('start')

	love.graphics.setFont(font)

	love.graphics.clear(0.1, 0.11, 0.14, 1)


	wave1:render()

	user:render()
	
	displayFPS()
	displayPoints()

	push:apply('end')
end

function displayFPS()
	love.graphics.setFont(FPSFont)
	love.graphics.setDefaultFilter('linear', 'linear')
	if love.timer.getFPS() < 30 then
		love.graphics.setColor(240, 252, 3, 1)
	elseif love.timer.getFPS() < 60  and love.timer.getFPS() > 30 then
		love.graphics.setColor(0, 1, 0, 1)
	else
		love.graphics.setColor(255, 0, 0, 1)
	end
	love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 20, WINDOW_HEIGHT - 50)
end


function displayPoints()
	love.graphics.setFont(PointsFont)
	love.graphics.setDefaultFilter('linear', 'linear')
	love.graphics.setColor(1,1,1, 1)	
	love.graphics.print(tostring(points), 20, 20)
end