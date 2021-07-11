alienlaser = Class{}

function alienlaser:init(x, y)
	self.x = x
	self.y = y
	self.image = love.graphics.newImage("sprites/Laser.png")
	self.width = self.image:getWidth()
	self.height = self.image:getHeight()
	self.hit = false
end


function alienlaser:render()
	if self.hit == false then
    	self.y = self.y + 10

		love.graphics.draw(self.image, self.x, self.y, 0, 1, 1, self.width, self.height)
	end
end