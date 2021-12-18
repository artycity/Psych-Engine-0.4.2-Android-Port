local dadLosing = false
local boyfriendLosing = false

function onUpdate(elapsed)
songPos = getSongPosition()
local currentBeat = (songPos/5000)*(curBpm/60)
setPropertyFromClass('PlayState', 'SONG.speed', 2.8 + (math.sin(currentBeat) * 0.6));
function opponentNoteHit(id, direction, noteType, isSustainNote)
cameraShake(game, 0.0015, 0.15)
setProperty('health', getProperty('health') - 1 * ((getProperty('health')/22))/6)
end
function goodNoteHit(id, direction, noteType, isSustainNote)
cameraShake(game, 0.0015, 0.15)
end
if getProperty('health') > 1.6 then
doTweenAlpha('iconDadFadeEventTween', 'iconP2', 0, 0.25, 'linear');
dadLosing = true
else
if dadLosing == true then
doTweenAlpha('iconDadFadeEventTween', 'iconP2', 1, 0.25, 'linear');
dadLosing = false
end
end

if getProperty('health') < 0.4 then
doTweenAlpha('iconBFFadeEventTween', 'iconP1', 0, 0.25, 'linear');
boyfriendLosing = true
else
if boyfriendLosing == true then
doTweenAlpha('iconBFFadeEventTween', 'iconP1', 1, 0.25, 'linear');
boyfriendLosing = false
end
end
end