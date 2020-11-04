-->8
-- camera

--[[
	 function new_camera

	 makes a new camera object with provided xy
]]

function new_camera(x,y)
	 local cam = {
			x=x,y=y
	 }

	 --[[
			function render

			moves the camera instantly to its current x,y
	 ]]

	 function cam:render()
			camera(self.x,self.y)
	 end

	 return cam
end
