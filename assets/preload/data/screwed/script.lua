local bfLosing = false
local dadLosing = false

function onUpdate(elapsed)
setPropertyFromClass('ClientPrefs', 'middleScroll', false)
if middleScroll == true then
endSong()
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
cameraShake(game, 0.015, 0.2)
characterPlayAnim('gf', 'scared', true)
doTweenZoom('camerazoom','camGame',0.8,0.26,'quadInOut')
if rating > 0 then
setProperty('health', getProperty('health') - 1 * (((getProperty('health')/22))/6)/rating)
else
setProperty('health', getProperty('health') - 1 * ((getProperty('health')/22))/6)
end
end
function goodNoteHit(id, direction, noteType, isSustainNote)
setPropertyFromClass('PlayState', 'SONG.speed', 3 * rating);
doTweenZoom('camerazoom','camGame',0.7,0.26,'quadInOut')
end
doTweenX('iconDadFadeEventTween', 'iconP2', 100, 0.001, 'linear');
songPos = getSongPosition()
local currentBeat = (songPos/5000)*(curBpm/60)
    noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 + 18 * math.sin((currentBeat+4*0.25) * math.pi), 0.0001)
    noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 + 18 * math.sin((currentBeat+5 *0.25) * math.pi), 0.0001)
    noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 + 18 * math.sin((currentBeat+6 *0.25) * math.pi), 0.0001)
    noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 + 18 * math.sin((currentBeat+7 *0.25) * math.pi), 0.0001)
    noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 + 18 * math.sin((currentBeat+4 *0.25) * math.pi), 0.0001)
    noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 + 18 * math.sin((currentBeat+5 *0.25) * math.pi), 0.0001)
    noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 + 18 * math.sin((currentBeat+6 *0.25) * math.pi), 0.0001)
    noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 + 18 * math.sin((currentBeat+7 *0.25) * math.pi), 0.0001)

		noteTweenAngle('defaultPlayerStrum0', 4, 0 + 18 * math.sin((currentBeat+7 *0.25) * math.pi), 0.001)
		noteTweenAngle('defaultPlayerStrum1', 5, 0 + 18 * math.sin((currentBeat+7 *0.25) * math.pi), 0.001)
		noteTweenAngle('defaultPlayerStrum2', 6, 0 + 18 * math.sin((currentBeat+7 *0.25) * math.pi), 0.001)
		noteTweenAngle('defaultPlayerStrum3', 7, 0 + 18 * math.sin((currentBeat+7 *0.25) * math.pi), 0.001)
    noteTweenAlpha('defaultOpponentStrum0', 0, 1 * math.sin((currentBeat*0.25) * math.pi), 0.00001)
    noteTweenAlpha('defaultOpponentStrum1', 1, 1 * math.sin((currentBeat*0.25) * math.pi), 0.00001)
    noteTweenAlpha('defaultOpponentStrum2', 2, 1 * math.sin((currentBeat*0.25) * math.pi), 0.00001)
    noteTweenAlpha('defaultOpponentStrum3', 3, 1 * math.sin((currentBeat*0.25) * math.pi), 0.00001)
setCharacterY('dad',getCharacterY('dad') + (math.sin(currentBeat) * 0.6))
function onMoveCamera(focus)
	if focus == 'boyfriend' then
		-- called when the camera focus on boyfriend
	elseif focus == 'dad' then
		setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.sin(currentBeat) * 0.6))
	end
end
if getProperty('health') > 1.6 then
doTweenAlpha('iconDadFadeEventTween', 'iconP1', 0, 0.25, 'linear');
dadLosing = true
else
if dadLosing == true then
doTweenAlpha('iconDadFadeEventTween', 'iconP1', 1, 0.25, 'linear');
dadLosing = false
end
end

if getProperty('health') < 0.4 then
doTweenAlpha('iconBFFadeEventTween', 'iconP2', 0, 0.25, 'linear');
boyfriendLosing = true
else
if boyfriendLosing == true then
doTweenAlpha('iconBFFadeEventTween', 'iconP2', 1, 0.25, 'linear');
boyfriendLosing = false
end
end
end