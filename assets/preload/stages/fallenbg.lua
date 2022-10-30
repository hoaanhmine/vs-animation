function onCreate()
	-- background shit
	makeLuaSprite('fallenbgANIMATED', 'fallenbgANIMATED', -400, -200);
	scaleObject('fallenbgANIMATED', 1.2, 1.2);
	addLuaSprite('fallenbgANIMATED', false);
	objectPlayAnimation('fallenbgANIMATED', 'fallingbg',false)
	addLuaSprite('fallenbgANIMATED',false);
	
end
