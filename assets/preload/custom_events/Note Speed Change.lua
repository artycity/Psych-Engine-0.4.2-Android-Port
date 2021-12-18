-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'Note Speed Change' then
		setPropertyFromClass('PlayState', 'SONG.speed', value1);
	end
end