function new_character()
	 local char = {}

	 --[[
			function move_character

			moves a character across the 8x8 tile map

			takes in:
			- char: a standardized character object (TODO: add ref to char obj file)
			- axis: "x" or "y", as a string 
			- vel: movement velocity. in short, speed times direction. in detail, how
			many pixels to move the character, negative to go left/down, positive to
			go right/up
			- note: 8 must be divisible by speed, else the function breaks

			returns:
			- if character can move, returns nothing
			- if character has finished moving across the 8 tile grid, returns true
			- if character cannot move, returns false
	 ]]--

	 function char:move_character(axis,vel)
			-- continue movement
			if self.moving then
				 if(axis == "x") then
						-- if it hits the tile edge, complete motions
						if (abs(self.dx) == 8) then
							 self.moving = false
							 self.dx = 0
							 return true
						end
						-- else, continue movement
						self.x+=vel
						self.dx+=vel
				 elseif(axis == "y") then
						-- if it hits the tile edge, complete motions
						if (abs(self.dy) == 8) then
							 self.moving = false
							 self.dy = 0
							 return true
						end
						-- else, continue movement
						self.y += vel
						self.dy += vel
				 end 
				 
			-- start movement
			else
				 if(axis == "x") then
						if (self:can_move(self.x+vel,self.y)) then
							 self.moving = true
							 self.x+=dir
							 self.dx+=dir
						else 
							 return false
						end
				 elseif(axis == "y") then
						if (can_move(self.x,self.y+vel)) then
							 self.moving = true
							 self.y+=dir
							 self.dy+=dir
						else 
							 return false
						end
				 end
			end
	 end

	 return char
end
