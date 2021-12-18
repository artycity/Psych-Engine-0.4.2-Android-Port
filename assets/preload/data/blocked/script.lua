local allowCountdown = false
local stopped = false
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
songPos = getSongPosition()
local currentBeat = (songPos/5000)*(curBpm/60)
if not stopped then
noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 + 4 * math.sin((currentBeat+4*0.25) * math.pi), 0.01)
noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 + 5 * math.sin((currentBeat+5 *0.25) * math.pi), 0.01)
noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 + 6 * math.sin((currentBeat+6 *0.25) * math.pi), 0.01)
noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 + 7 * math.sin((currentBeat+7 *0.25) * math.pi), 0.01)
end
if curStep > 512 and curStep < 896 then
    noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 + 18 * math.sin((currentBeat+4*0.25) * math.pi), 0.01)
    noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 + 18 * math.sin((currentBeat+5 *0.25) * math.pi), 0.01)
    noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 + 18 * math.sin((currentBeat+6 *0.25) * math.pi), 0.01)
    noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 + 18 * math.sin((currentBeat+7 *0.25) * math.pi), 0.01)
    noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 + 18 * math.sin((currentBeat+4 *0.25) * math.pi), 0.01)
    noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 + 18 * math.sin((currentBeat+5 *0.25) * math.pi), 0.01)
    noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 + 18 * math.sin((currentBeat+6 *0.25) * math.pi), 0.01)
    noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 + 18 * math.sin((currentBeat+7 *0.25) * math.pi), 0.01)
stopped = true
end
if curStep == 897 then
    noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0, 0.5)
    noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1, 0.5)
    noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2, 0.5)
    noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3, 0.5)
    noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0, 0.5)
    noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1, 0.5)
    noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2, 0.5)
    noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3, 0.5)
stopped = false
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
cameraShake(game, 0.0015, 0.15)
if curStep > 512 and curStep < 896  then
cameraShake(other, 0.015, 0.15)
cameraShake(hud, 0.015, 0.15)
end
cameraSetTarget('dad')
doTweenZoom('camerazoom','camGame',0.775,0.15,'quadInOut')
end
function goodNoteHit(id, direction, noteType, isSustainNote)
cameraShake(game, 0.0015, 0.15)

cameraSetTarget('boyfriend')
doTweenZoom('camerazoom','camGame',0.725,0.15,'quadInOut')
end
end