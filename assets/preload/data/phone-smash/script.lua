local Leftstrum = false
local Downstrum = false
local Upstrum = false
local Rightstrum = false

function onUpdate(elapsed)
setPropertyFromClass('ClientPrefs', 'middleScroll', false)
if middleScroll == true then
endSong()
end
songPos = getSongPosition()
local currentBeat = (songPos/5000)*(1200/60)
local currentBeat2 = (songPos/5000)*(180/60)
function onMoveCamera(focus)
	if focus == 'boyfriend' then
		-- called when the camera focus on boyfriend
	elseif focus == 'dad' then
		setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.sin(currentBeat) * 0.6))
	end
end
		local currentBeat = (songPos/5000)*(curBpm/60)

		noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 50*math.sin((currentBeat2+4*0.25)*math.pi), 0.5)
		noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 350 + 2000*math.sin((currentBeat2+8*0.25)*math.pi), 3)
		noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 50*math.sin((currentBeat2+4*0.25)*math.pi), 0.5)
		noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 350 + 2000*math.sin((currentBeat2+8*0.25)*math.pi), 3)

		noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 + 50*math.sin((currentBeat2+4*0.25)*math.pi), 0.5)
		noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 + 350 - 2000*math.sin((currentBeat2+8*0.25)*math.pi), 3)
		noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 + 50*math.sin((currentBeat2+4*0.25)*math.pi), 0.5)
		noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 + 350 - 2000*math.sin((currentBeat2+8*0.25)*math.pi), 3)
setCharacterY('dad',getCharacterY('dad') + (math.sin(currentBeat2) * 0.3))
function opponentNoteHit(id, direction, noteType, isSustainNote)
setProperty('health', getProperty('health') - 1 * ((getProperty('health')/22))/8)
cameraShake(game, 0.015, 0.2)
cameraShake(other, 0.015, 0.2)
cameraShake(hud, 0.015, 0.2)
characterPlayAnim('gf', 'scared', true)
doTweenZoom('camerazoom','camGame',1,0.15,'quadInOut')
end
function goodNoteHit(id, direction, noteType, isSustainNote)
cameraShake(game, 0.005, 0.15)
doTweenZoom('camerazoom','camGame',0.85,0.15,'quadInOut')
end
function noteMiss(direction)
setProperty('health', getProperty('health') + 0.025)
end
function noteMissPress(direction)
setProperty('health', getProperty('health') + 0.025)
end
end