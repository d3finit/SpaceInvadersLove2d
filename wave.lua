push = require "push"
Class = require 'Class'


wave = Class{}

function wave:init(name,aliens,bosses)
	self.name = name
	self.aliens = aliens
    self.bosses = bosses

end


function wave:render()
    for count = 1, table.getn(self.aliens) do
        self.aliens[count]:render()

		for count2 = 1, table.getn(player.lazers) do
			if aliens[count]:check(player.lazers[count2]) == true then
				points = points + 100
				player.lazers[count2].hit = true
			end
		end
    end

  
    for count = 1, table.getn(self.bosses) do
        if aliens[count]:check(self.bosses[count]) == true then
            points = points + 1000
            self.bosses[count].hit = true
        end
    end
end

function wave:check()
    if self.remining == 0 then
        print("Wave Completete")
    else
        return
    end
end