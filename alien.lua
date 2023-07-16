alien = Class{}

function alien:init(x, y)
	self.x = x
	self.y = y

	self.image = love.graphics.newImage("sprites/Alien.png")
	self.width = self.image:getWidth()
	self.height = self.image:getHeight()
	self.hit = false
	
end


function alien:render()
	if self.hit == true then
		return
	else
		love.graphics.draw(self.image, self.x, self.y, 0, 1, 1, self.width, self.height)
	end

end

function alien:check(laser)
	if laser.y-20 == self.y and laser.x > self.x-40 and laser.x < self.x+40 and self.hit == false then
		self.hit = true
		return true
	end
end