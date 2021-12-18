local allowCountdown = false
local stopped = true
function onStartCountdown()
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
if curStep > 785 or curStep > 1047 then
if difficulty == 3 then
setPropertyFromClass('PlayState', 'SONG.speed', 3.2);
elseif difficulty == 1 then
setPropertyFromClass('PlayState', 'SONG.speed', 3);
elseif difficulty == 0 then
setPropertyFromClass('PlayState', 'SONG.speed', 2.8);
end
end
songPos = getSongPosition()
local currentBeat = (songPos/5000)*(curBpm/60)
local currentBeat2 = (songPos/800)*(curBpm/100)
doTweenZoom('cameraTween', 'camHUD', 1 + (math.sin(currentBeat) * 0.1), 0.00001, 'quadInOut')
if curStep < 525 then
setPropertyFromClass('PlayState', 'SONG.speed', 3.1 + (math.sin(currentBeat) * 0.6));
end
if curStep > 525 and curStep < 785 or curStep > 917 and curStep < 1047 then
    noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 150 * math.sin((currentBeat2*0.25) * math.pi), 0.00001, 'quadInOut')
    noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 150 * math.sin((currentBeat2*0.25) * math.pi), 0.00001, 'quadInOut')
    noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 150 * math.sin((currentBeat2*0.25) * math.pi), 0.00001, 'quadInOut')
    noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 150 * math.sin((currentBeat2*0.25) * math.pi), 0.00001, 'quadInOut')
    noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 + 150 * math.sin((currentBeat2*0.25) * math.pi), 0.00001, 'quadInOut')
    noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 + 150 * math.sin((currentBeat2*0.25) * math.pi), 0.00001, 'quadInOut')
    noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 + 150 * math.sin((currentBeat2*0.25) * math.pi), 0.00001, 'quadInOut')
    noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 + 150 * math.sin((currentBeat2*0.25) * math.pi), 0.00001, 'quadInOut')
    noteTweenY('defaultOpponentStrumY0', 0, defaultOpponentStrumY0, 0.5)
    noteTweenY('defaultOpponentStrumY1', 1, defaultOpponentStrumY1, 0.5)
    noteTweenY('defaultOpponentStrumY2', 2, defaultOpponentStrumY2, 0.5)
    noteTweenY('defaultOpponentStrumY3', 3, defaultOpponentStrumY3, 0.5)
    noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0, 0.5)
    noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1, 0.5)
    noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2, 0.5)
    noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3, 0.5)
    noteTweenAlpha('defaultOpponentStrum0', 0, 1 * math.sin((currentBeat2*0.25) * math.pi), 0.5)
    noteTweenAlpha('defaultOpponentStrum1', 1, 1 * math.sin((currentBeat2*0.25) * math.pi), 0.5)
    noteTweenAlpha('defaultOpponentStrum2', 2, 1 * math.sin((currentBeat2*0.25) * math.pi), 0.5)
    noteTweenAlpha('defaultOpponentStrum3', 3, 1 * math.sin((currentBeat2*0.25) * math.pi), 0.5)
else
    noteTweenAlpha('defaultOpponentStrum0', 0, 1, 0.5)
    noteTweenAlpha('defaultOpponentStrum1', 1, 1, 0.5)
    noteTweenAlpha('defaultOpponentStrum2', 2, 1, 0.5)
    noteTweenAlpha('defaultOpponentStrum3', 3, 1, 0.5)
end
if curStep < 525 or curStep > 785 and curStep < 917 or curStep > 1047 then
    noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 + (1 * 2) * math.sin((currentBeat+4*0.25) * math.pi), 0.0001)
    noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 + (2 * 2) * math.sin((currentBeat+5 *0.25) * math.pi), 0.0001)
    noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 + (3 * 2) * math.sin((currentBeat+6 *0.25) * math.pi), 0.0001)
    noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 + (4 * 2) * math.sin((currentBeat+7 *0.25) * math.pi), 0.0001)
    noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 + (1 * 2) * math.sin((currentBeat+4 *0.25) * math.pi), 0.0001)
    noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 + (2 * 2) * math.sin((currentBeat+5 *0.25) * math.pi), 0.0001)
    noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 + (3 * 2) * math.sin((currentBeat+6 *0.25) * math.pi), 0.0001)
    noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 + (4 * 2) * math.sin((currentBeat+7 *0.25) * math.pi), 0.0001)
    noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 + (1 * 2) * math.sin((currentBeat+4*0.25) * math.pi), 0.0001)
    noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 + (2 * 2) * math.sin((currentBeat+5 *0.25) * math.pi), 0.0001)
    noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 + (3 * 2) * math.sin((currentBeat+6 *0.25) * math.pi), 0.0001)
    noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 + (4 * 2) * math.sin((currentBeat+7 *0.25) * math.pi), 0.0001)
    noteTweenY('defaultOpponentStrumY0', 0, defaultOpponentStrumY0 + (1 * 2) * math.sin((currentBeat+0 *0.25) * math.pi), 0.0001)
    noteTweenY('defaultOpponentStrumY1', 1, defaultOpponentStrumY1 + (2 * 2) * math.sin((currentBeat+1 *0.25) * math.pi), 0.0001)
    noteTweenY('defaultOpponentStrumY2', 2, defaultOpponentStrumY2 + (3 * 2) * math.sin((currentBeat+2 *0.25) * math.pi), 0.0001)
    noteTweenY('defaultOpponentStrumY3', 3, defaultOpponentStrumY3 + (4 * 2) * math.sin((currentBeat+3 *0.25) * math.pi), 0.0001)
if difficulty == 3 then
setPropertyFromClass('PlayState', 'SONG.speed', 3.2);
elseif difficulty == 1 then
setPropertyFromClass('PlayState', 'SONG.speed', 3);
elseif difficulty == 0 then
setPropertyFromClass('PlayState', 'SONG.speed', 2.8);
end
else
stopped = true
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
doTweenZoom('camerazoom','camGame',0.775,0.15,'quadInOut')
cameraShake(game, 0.0015, 0.15)
setProperty('health', getProperty('health') - 1 * ((getProperty('health')/22))/6)
cameraSetTarget('dad')
end
function goodNoteHit(id, direction, noteType, isSustainNote)
if curStep > 525 and curStep < 785 or curStep > 917 and curStep < 1047 then
setPropertyFromClass('PlayState', 'SONG.speed', 3 * rating);
else
stopped = true
end
cameraShake(game, 0.0015, 0.15)
doTweenZoom('camerazoom','camGame',0.725,0.15,'quadInOut')
cameraSetTarget('boyfriend')
end
end