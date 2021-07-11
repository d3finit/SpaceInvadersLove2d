push = require "push"
Class = require 'Class'

require 'lazer'

player = Class{}

function player:init(x, y, dx)
	self.x = x
	self.y = y
    self.dx = dx
	self.image = love.graphics.newImage("sprites/Player.png")
	self.width = self.image:getWidth()
	self.height = self.image:getHeight()

    self.lazers = {

    }
end


function player:render()
    self.x = self.x + self.dx
	love.graphics.draw(self.image, self.x, self.y, 0, 1, 1, self.width, self.height)
    if self.x < 100 then
        self.dx = 5

    elseif self.x > 1250 then
        self.dx = -5

    end

    for count = 1, table.getn(self.lazers) do
        self.lazers[count]:render()
    end
end


function player:fire()
    table.insert(self.lazers, lazer(self.x,self.y-30))
end