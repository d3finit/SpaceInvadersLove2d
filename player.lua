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
    self.hit = false

    self.lazers = {

    }
end


function player:render()


    if self.hit == true then
        gameover = true
        self.x = 625
        self.y = WINDOW_HEIGHT-50
        love.graphics.draw(self.image, self.x, self.y, 0, 1, 1, self.width, self.height)
    elseif self.hit == false then
        
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
end


function player:fire()
    if self.hit == false then
        table.insert(self.lazers, lazer(self.x,self.y-30))
    end
end



function player:check(alienlaser)
    if alienlaser.y-20 == self.y and alienlaser.x > self.x-40 and alienlaser.x < self.x+40 and self.hit == false then
		self.hit = true
		return true
	end
end