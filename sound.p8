-->8
-- sound

--[[
	 function nr_sfx

	 short for 'no repeat sound effects'. plays a sound effect in channel 3, but
	 only if no sfx's playing now

	 takes in:
	 - sfx_id: id num of sfx to play
]]

function nr_sfx(sfx_id)
	print(stat(19))
	if (stat(19) == -1) then
		sfx(sfx_id,3)
	end
end
