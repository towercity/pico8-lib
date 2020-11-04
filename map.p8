-->8
-- map

--[[
	 function new_map

	 creates a new map object

	 takes in:
	 - x1,y1: xy values of the top of the maps location on the map sheet
	 - x2,y2: xy values of the bottom corner

	 returns the map object
]]

function new_map(x1,y1,x2,y2)
	 local map = {
			x1=x1,y1=y1,
			x2=x2,y2=y2
	 }

	 --[[
			function draw

			draws the map
	 ]]
	 function map:draw()
			map(self.x1,self.y1,0,0,self.x2,self.y2)
	 end 
end
