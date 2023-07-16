push = require "push"
Class = require 'Class'


gameover = false
wave = Class{}

function wave:init(level)
	self.level = level


    if level == 1 then
        self.aliensfireing = {
            alienattack(200,400),
            alienattack(300,400),
            alienattack(400,400),
            alienattack(500,400),
            alienattack(600,400),
            alienattack(700,400),
            alienattack(800,400),
            alienattack(900,400),
            alienattack(1000,400),
            alienattack(1100,400)
        }

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
            alien(1100,300)
        }
        self.bosses = {
            boss(700,200,1000)
        }
        self.remaining = 21
    end

end


function wave:render()


    if gameover == true then
	    love.graphics.printf('Game Over!',0,100,1280,'center') 
        
    elseif gameover == false then
        for count = 1, table.getn(self.aliensfireing) do
            self.aliensfireing[count]:render()
            for count2 = 1, table.getn(user.lasers) do
                if self.aliensfireing[count]:check(user.lasers[count2]) == true then
                    points = points + 100
                    self.remaining = self.remaining - 1
                    print(self.remaining)
                    user.lasers[count2].hit = true
                end
            end
        end
    
        for count = 1, table.getn(self.aliens) do
            self.aliens[count]:render()
            for count2 = 1, table.getn(user.lasers) do
                if self.aliens[count]:check(user.lasers[count2]) == true then
                    points = points + 100
                    self.remaining = self.remaining - 1
                    print(self.remaining)
                    user.lasers[count2].hit = true
                end
            end
        end
      
        user:check()
      
        for count = 1, table.getn(self.bosses) do
            self.bosses[count]:render()
            for count2 = 1, table.getn(user.lasers) do
                if self.bosses[count]:check(user.lasers[count2]) == true then
                    points = points + 1000
                    self.remaining = self.remaining - 1
                    user.lasers[count2].hit = true
                elseif self.bosses[count]:check(user.lasers[count2]) == "hitw/hp" then
                    user.lasers[count2].hit = true
                end
            end
        end
    end
end

function wave:check()
    if self.remaining == 0 then

	love.graphics.setFont(love.graphics.newFont('Press-Start-2P.ttf', 30))
	love.graphics.printf('You Win!',0,15,1280,'center') 
    else
        return
    end
end