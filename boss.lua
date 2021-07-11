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

		love.graphics.printf('Boss: '..self.hp,0,15,1280,'center') 
	end

end

function boss:check(lazer)
	if lazer.y-60 == self.y and lazer.x > self.x-60 and lazer.x < self.x+60 and self.hit == false and self.hp ~= 0 and lazer.hit == false then
		self.hp = self.hp - 50
		return "hitw/hp"
	end

	if self.hp == 0 and self.hit == false then
		self.hit = true
		return true
	end
end