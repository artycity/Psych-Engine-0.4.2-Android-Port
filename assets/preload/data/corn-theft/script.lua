local allowCountdown = false
local leftpressed = false
local downpressed = false
local uppressed = false
local rightpressed = false
local antipiracy = false
function onStartCountdown()
	normalbfy = getCharacterY('boyfriend')
	normalby = getCharacterY('dad')
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.5);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'bambi_dialogue');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

function onUpdate(elapsed)
songPos = getSongPosition()
local currentBeat = (songPos/5000)*(curBpm/60)
if curStep > 159 and curStep < 192 or curStep > 224 and curStep < 256 or curStep > 288 and curStep < 321 or curStep > 351 and curStep < 385 or curStep > 383 and curStep < 450 or curStep > 512 and curStep < 576 or curStep > 672 and curStep < 688 or curStep > 700 and curStep < 721 or curStep > 751 and curStep < 912 then
setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.cos(currentBeat) * 0.1))
setCharacterY('dad',getCharacterY('dad') - (math.sin(currentBeat) * 0.1))
end
if curStep > 450 and curStep < 512 or curStep > 576 and curStep < 640  or curStep > 751 and curStep < 912 then
setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.cos(currentBeat) * 0.1))
setCharacterY('boyfriend',getCharacterY('boyfriend') + (math.sin(currentBeat) * 0.1))
end
if curStep > 912 then
setCharacterY('boyfriend',normalbfy)
setCharacterY('dad',normalby)
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
cameraShake(game, 0.0015, 0.15)
if curStep > 159 and curStep < 192 or curStep > 224 and curStep < 256 or curStep > 288 and curStep < 321 or curStep > 351 and curStep < 385 or curStep > 383 and curStep < 450 or curStep > 512 and curStep < 576 or curStep > 672 and curStep < 688 or curStep > 700 and curStep < 721 or curStep > 751 and curStep < 912 then
cameraShake(other, 0.015, 0.15)
cameraShake(hud, 0.015, 0.15)
end
setProperty('health', getProperty('health') - 1 * ((getProperty('health')/22))/6)
cameraSetTarget('dad')
doTweenZoom('camerazoom','camGame',0.775,0.15,'quadInOut')
end
function goodNoteHit(id, direction, noteType, isSustainNote)
cameraShake(game, 0.0015, 0.15)
if curStep > 159 and curStep < 192 or curStep > 224 and curStep < 256 or curStep > 288 and curStep < 321 or curStep > 351 and curStep < 385 or curStep > 383 and curStep < 450 or curStep > 512 and curStep < 576 or curStep > 672 and curStep < 688 or curStep > 700 and curStep < 721  or curStep > 751 and curStep < 912 or curStep > 450 and curStep < 512 or curStep > 576 and curStep < 640 then
if direction == 0 then
noteTweenX('defaultPlayerStrumX0', 4, defaultPlayerStrumX3, 0.001)
noteTweenX('defaultPlayerStrumX1', 7, defaultPlayerStrumX0, 0.001)
elseif direction == 1 then
noteTweenX('defaultPlayerStrumX2', 5, defaultPlayerStrumX2, 0.001)
noteTweenX('defaultPlayerStrumX3', 6, defaultPlayerStrumX1, 0.001)
elseif direction == 2 then
noteTweenX('defaultPlayerStrumX4', 6, defaultPlayerStrumX2, 0.001)
noteTweenX('defaultPlayerStrumX5', 5, defaultPlayerStrumX1, 0.001)
elseif direction == 3 then
noteTweenX('defaultPlayerStrumX6', 4, defaultPlayerStrumX0, 0.001)
noteTweenX('defaultPlayerStrumX7', 7, defaultPlayerStrumX3, 0.001)
end
else
noteTweenX('defaultPlayerStrumX0', 4, defaultPlayerStrumX0, 0.001)
noteTweenX('defaultPlayerStrumX1', 5, defaultPlayerStrumX1, 0.001)
noteTweenX('defaultPlayerStrumX2', 6, defaultPlayerStrumX2, 0.001)
noteTweenX('defaultPlayerStrumX3', 7, defaultPlayerStrumX3, 0.001)
end
cameraSetTarget('boyfriend')
doTweenZoom('camerazoom','camGame',0.725,0.15,'quadInOut')
end
end