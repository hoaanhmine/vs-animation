function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Warning Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Warning' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'WARNING_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '1.8'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Warning' then
		characterPlayAnim('dark lord', 'TDL_attack', true);
		characterPlayAnim('boyfriend', 'dodge', true);
		playSound('gunshot', 0.5);
		cameraShake(none, 0.01, 0.1); -- none is nothing anyway
	end
end

-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'Warning' then
		playSound('darkLordAttack', 0.2);
		characterPlayAnim('dark lord', 'TLD_attack', true);
		characterPlayAnim('boyfriend', 'hurt', true);
		cameraFlash('game', '0xFFff000a', 0.1, true);
		cameraShake(none, 0.05, 0.1);
	end
end