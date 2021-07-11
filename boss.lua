boss = Class{}

function boss:init(x, y,hp)
	self.x = x
	self.y = y
	self.hp = 1000

	self.image = love.graphics.newImage("sprites/Boss.png")
	self.width = self.image:getWidth()
	self.height = self.image:getHeight()
	self.hit = false
	
end


function boss:render()
	if self.hit == true then
		return
	else
		love.graphics.draw(self.image, self.x, self.y, 0, 1, 1, self.width, self.height)
	end

end

function boss:check(lazer)
	if lazer.y-20 == self.y and lazer.x > self.x-40 and lazer.x < self.x+40 and self.hit == false then
		self.hit = true
		return true
	end
end