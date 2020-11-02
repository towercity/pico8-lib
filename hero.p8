--[[
	 function new_hero

	 creates a new player controlled character (aka hero)

	 takes in:
	 - x, y: x and y coordinates
	 - spr: nested tables of sprites: {{d1,d2},{u1,u2},{l1,l2},{r1,r2}}

	 returns: hero object

	 dependencies:
	 - new_character, from character.p8
	 - nr_sfx, from sound.p8
]]

function new_hero(x,y,spr)
	 local hero = new_char(x,y,spr)

	 --[[
			function move_hero

			listens for button inputs then moves hero

			takes in nothin, returns nothing: just moves
	 ]]

	 function hero:move_hero()
			if self.moving then
				 -- tests the axis to move on,
				 -- then tests if movement has end and should restart
				 if self.dx != 0 then
						if self:move_character("x",sgn(self.dx)) then
							 self:move_hero()
						end
				 elseif self.dy != 0 then
						if self:move_character("y",sgn(self.dy)) then
							 self:move_hero()
						end
				 end
			else
				 --listens for movement input

				 -- variable can_move to save if char has moved
				 local can_move = true
				 if btn(0) then
						can_move = self:move_character("x",-1)
				 elseif btn(1) then
						can_move = self:move_character("x",1)
				 elseif btn(2) then
						can_move = self:move_character("y",-1)
				 elseif btn(3) then
						can_move = self:move_character("y",1)
				 end

				 if not can_move then
						nr_sfx(1)
				 end 
			end
	 end

	 return hero
end
