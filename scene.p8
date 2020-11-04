-->8
-- scene

--[[
	 function new_scene

	 creates an overarching scene object with map, npc, etc, for easy drawing and
	 updating

	 takes in:
	 - map: a map object that contains the scenes background map layer
	 - starting_pos: a table of the player characters starting xy
	 - npcs: table of npc objects to load in
	 - music: id of song to play

	 returns the scene
]]

function new_scene(map,starting_pos,npcs,music,hero)
	 local scene = {
			map=map,
			npcs=npcs,
			hero=hero
	 }

	 --[[
			local function draw_object

			wrapper around draw function to allow in for loop
	 ]]
	 
	 local function draw_object(object)
			object:draw()
	 end

	 --[[
			function draw

			draws the map, hero, and npcs
	 ]]

	 function scene:draw()
			-- map first
			self.map:draw()

			-- then npcs
			foreach(self.npcs, draw_object)

			-- and then the hero
			self.hero:draw()
	 end
	 
	 -- TODO: add init and update
	 return scene
end
