local Leftstrum = false
local Downstrum = false
local Upstrum = false
local Rightstrum = false

function onStartCountdown()
setCharacterX('dad', 300)
       defaultDadX = getCharacterX('dad')
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if math.random(1,4) == 1 then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets_reversed'); --Change texture
		else
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets_3D_reversed'); --Change texture
		end
	end
end

function onBeatHit()
        if curBeat % 16 == 0 then
                setObjectOrder('dadGroup', 25)
        end
end

function onUpdate(elapsed)
setPropertyFromClass('ClientPrefs', 'middleScroll', false)
if middleScroll == true then
endSong()
end
songPos = getSongPosition()
local currentBeat = (songPos/5000)*(1200/60)
local currentBeat2 = (songPos/5000)*(curBpm/60)
                    if getCharacterX('dad') > defaultDadX - 20 and getCharacterX('dad') < defaultDadX - 5 then
                           setObjectOrder('dadGroup', 3)
                    end
	setCharacterX('dad',getCharacterX('dad') + (math.sin(currentBeat2) * 3))
function onMoveCamera(focus)
	if focus == 'boyfriend' then
		-- called when the camera focus on boyfriend
	elseif focus == 'dad' then
		setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.sin(currentBeat) * 0.6))
	end
end
setPropertyFromClass('PlayState', 'SONG.speed', 2.6 + (math.sin(currentBeat) * 0.6));
noteTweenX(defaultPlayerStrumX0, 4, ((screenWidth / 2) - (157 / 2)) + (math.cos((currentBeat*0.25) + (0) * 2) * 300), 0.0001)
noteTweenX(defaultPlayerStrumX1, 5, ((screenWidth / 2) - (157 / 2)) + (math.cos((currentBeat*0.25) + (1) * 2) * 300), 0.0001)
noteTweenX(defaultPlayerStrumX2, 6, ((screenWidth / 2) - (157 / 2)) + (math.cos((currentBeat*0.25) + (2) * 2) * 300), 0.0001)
noteTweenX(defaultPlayerStrumX3, 7, ((screenWidth / 2) - (157 / 2)) + (math.cos((currentBeat*0.25) + (3) * 2) * 300), 0.0001)

noteTweenY('defaultPlayerStrumY0', 4, ((screenHeight / 2) - (157 / 2)) + 1 * (math.sin((currentBeat*0.25) + (0) * 2) * 300), 0.0001)
noteTweenY('defaultPlayerStrumY1', 5, ((screenHeight / 2) - (157 / 2)) + 1 * (math.sin((currentBeat*0.25) + (1) * 2) * 300), 0.0001)
noteTweenY('defaultPlayerStrumY2', 6, ((screenHeight / 2) - (157 / 2)) + 1 * (math.sin((currentBeat*0.25) + (2) * 2) * 300), 0.0001)
noteTweenY('defaultPlayerStrumY3', 7, ((screenHeight / 2) - (157 / 2)) + 1 * (math.sin((currentBeat*0.25) + (3) * 2) * 300), 0.0001)

noteTweenX('fake1', 0, ((screenWidth / 2) - (157 / 2)) + 1 * (math.sin((currentBeat*0.25) + (4) * 2) * 300), 0.001)
noteTweenX('fake2', 1, ((screenWidth / 2) - (157 / 2)) + 1 * (math.sin((currentBeat*0.25) + (5) * 2) * 300), 0.001)
noteTweenX('fake3', 2, ((screenWidth / 2) - (157 / 2)) + 1 * (math.sin((currentBeat*0.25) + (6) * 2) * 300), 0.001)
noteTweenX('fake4', 3, ((screenWidth / 2) - (157 / 2)) + 1 * (math.sin((currentBeat*0.25) + (7) * 2) * 300), 0.001)

noteTweenY('fake1Y', 0, ((screenHeight / 2) - (157 / 2)) + 1 * (math.cos((currentBeat*0.25) + (4) * 2) * 300), 0.001)
noteTweenY('fake2Y', 1, ((screenHeight / 2) - (157 / 2)) + 1 * (math.cos((currentBeat*0.25) + (5) * 2) * 300), 0.001)
noteTweenY('fake3Y', 2, ((screenHeight / 2) - (157 / 2)) + 1 * (math.cos((currentBeat*0.25) + (6) * 2) * 300), 0.001)
noteTweenY('fake4Y', 3, ((screenHeight / 2) - (157 / 2)) + 1 * (math.cos((currentBeat*0.25) + (7) * 2) * 300), 0.001)
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