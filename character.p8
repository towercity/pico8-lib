-->8
-- character class

--[[
	 function new_character

	 creates a generic character object

	 takes in:
	 - x, y: x and y coordinates
	 - spr: nested tables of sprites: {{u1,u2},{d1,d2},{l1,l2},{r1,r2}}

	 returns: character object
]]

function new_character(x,y,sprites)
	 local char = {
			-- passed in values
			x=x,
			y=y,
			spr=sprites,

			-- currently selected sprite index
			spr_i=1,

			-- keeps record of sprite "dance", which is my term for the animation
			-- that fakes walking. 1 is l, 2 is right
			dance=1,

			-- direction properties: keeps track of tile-based movement animation
			dx=0,
			dy=0,

			-- height and width in px, in case needed for external functions
			w=16,
			h=16,

			moving=false
	 }

	 --[[
			function draw

			draws the character to screen
	 ]]

	 function char:draw()
			spr(self.spr[self.spr_i][self.dance],self.x,self.y,2,2)
	 end

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
	 ]]

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
				 self:flip_sprite()
				 if(axis == "x") then
						if (self:can_move(self.x+vel,self.y)) then
							 self.moving = true
							 self.x+=vel
							 self.dx+=vel
							 if (sgn(vel) == -1) then
									self.spr_i = 3
							 else
									self.spr_i = 4
							 end
						else 
							 return false
						end
				 elseif(axis == "y") then
						if (self:can_move(self.x,self.y+vel)) then
							 self.moving = true
							 self.y+=vel
							 self.dy+=vel
							 if (sgn(vel) == -1) then
									self.spr_i = 1
							 else
									self.spr_i = 2
							 end
						else 
							 return false
						end
				 end
			end
	 end

	 --[[
			function can_move

			tests if character can be moved to passed coordinates. flag 1 for solid

			takes in:
			- x,y: coordinates of space to move to

			returns true/false if char can move
	 ]]

	 function char:can_move(x,y)
			function solid(x,y)
				 local map_x=flr(x/8)
				 local map_y=flr(y/8)
	
				 local map_sprite=mget(map_x,map_y)
				 local flag=fget(map_sprite)
	
				 return flag==1
			end

			if (solid(x,y)) return false
			if (solid(x+15,y)) return false
			if (solid(x,y+15)) return false
			if (solid(x+15,y+15)) return false

			return true
		end

	 --[[
			function flip_sprite

			flips the sprite direction
	 ]]

	 function char:flip_sprite()
			if self.dance == 1 then
				 self.dance = 2
			elseif self.dance == 2 then
				 self.dance = 1
			end
	 end

	 return char
end
