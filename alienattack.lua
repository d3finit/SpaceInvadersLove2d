push = require "push"
Class = require 'Class'

require 'alienlaser'


alienattack = Class{}

function alienattack:init(x, y)
	self.x = x
	self.y = y

	self.image = love.graphics.newImage("sprites/Alien.png")
	
	self.width = self.image:getWidth()
	self.height = self.image:getHeight()
	self.hit = false
	self.alienlasers = {

    }
end


function alienattack:render()
	if self.hit == true then
		return
	elseif self.hit == false then
		for count = 1, table.getn(self.alienlasers) do
			self.alienlasers[count]:render()
		end

		love.graphics.draw(self.image, self.x, self.y, 0, 1, 1, self.width, self.height)
		n1 = math.random (1, 100)
		n2 = math.random (1, 100)

		if n1 == n2 then
			table.insert(self.alienlasers, alienlaser(self.x,self.y+30))
		end

	end

end

function alienattack:check(lazer)
	if lazer.y-20 == self.y and lazer.x > self.x-40 and lazer.x < self.x+40 and self.hit == false then
		self.hit = true
		return true
	end
end