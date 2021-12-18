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
local currentBeat2 = (songPos/200)*(curBpm/200)

noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 100*math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 100*math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 100*math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 100*math.cos((currentBeat2*0.25)*math.pi), 0.5)

noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 + 100*math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 + 100*math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 + 100*math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 + 100*math.cos((currentBeat2*0.25)*math.pi), 0.5)
if curStep > 896 and curStep < 1024 then

cameraShake(game, 0.03, 0.3)

noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 250 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 250 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 250 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 250 *math.cos((currentBeat2*0.25)*math.pi), 0.5)

noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 + 250 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 + 250 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 + 250 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 + 250 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
else
cameraShake(game, 0, 0)

noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 100*math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 100*math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 100*math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 100*math.cos((currentBeat2*0.25)*math.pi), 0.5)

noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 + 100*math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 + 100*math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 + 100*math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 + 100*math.cos((currentBeat2*0.25)*math.pi), 0.5)

function opponentNoteHit(id, direction, noteType, isSustainNote)
if curStep > 1150 and curStep < 1407 then

	cameraShake(game, 0.03, 0.3)
	
	
	

	else

	cameraShake(game, 0, 0)
	

end
cameraShake(game, 0.0015, 0.15)
setProperty('health', getProperty('health') - 1 * ((getProperty('health')/22))/6)
doTweenZoom('camerazoom','camGame',0.775,0.15,'quadInOut')
cameraSetTarget('dad')
end
end
function goodNoteHit(id, direction, noteType, isSustainNote)
cameraShake(game, 0.0015, 0.15)
doTweenZoom('camerazoom','camGame',0.725,0.15,'quadInOut')
cameraSetTarget('boyfriend')
end
end