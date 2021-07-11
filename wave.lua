push = require "push"
Class = require 'Class'


wave = Class{}

function wave:init(level)
	self.level = level


    if level == 1 then
        self.aliens = {
            alien(200,300),
            alien(300,300),
            alien(400,300),
            alien(500,300),
            alien(600,300),
            alien(700,300),
            alien(800,300),
            alien(900,300),
            alien(1000,300),
            alien(1100,300), 
        
            alien(200,400),
            alien(300,400),
            alien(400,400),
            alien(500,400),
            alien(600,400),
            alien(700,400),
            alien(800,400),
            alien(900,400),
            alien(1000,400),
            alien(1100,400)
        }
        self.bosses = {
            boss(700,200,1000)
        }
        self.remaining = 21
    end

end


function wave:render()
    for count = 1, table.getn(self.aliens) do
        self.aliens[count]:render()
		for count2 = 1, table.getn(user.lazers) do
			if self.aliens[count]:check(user.lazers[count2]) == true then
				points = points + 100
                self.remaining = self.remaining - 1
                print(self.remaining)
				user.lazers[count2].hit = true
			end
		end
    end

  
    for count = 1, table.getn(self.bosses) do
        self.bosses[count]:render()
		for count2 = 1, table.getn(user.lazers) do
			if self.bosses[count]:check(user.lazers[count2]) == true then
				points = points + 1000
                self.remaining = self.remaining - 1
				user.lazers[count2].hit = true
            elseif self.bosses[count]:check(user.lazers[count2]) == "hitw/hp" then
				user.lazers[count2].hit = true
			end
		end
    end
end

function wave:check()
    if self.remaining == 0 then

	love.graphics.setFont(font)
	love.graphics.printf('You Win!',0,15,1280,'center') 
    else
        return
    end
end