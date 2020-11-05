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

function new_scene(map,starting_pos,npcs,song,hero)
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
			if npcs then foreach(self.npcs, draw_object) end

			-- and then the hero
			self.hero:draw()
	 end
	 
	 --[[
			function init

			sets up the scene
	 ]]

	 function scene:init()
			music(song)
			self:draw()
	 end

	 --[[
			function update

			contains update logic for the scene
	 ]]
	 function scene:update()
			hero:move_hero()
	 end
	 
	 return scene
end
