-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'Opponent Fade' then
		duration = tonumber(value1);
		if duration < 0 then
			duration = 0;
		end

		doTweenAlpha('dadFadeEventTween', 'dad', value2, duration, 'linear');
		doTweenAlpha('iconDadFadeEventTween', 'iconP2', value2, duration, 'linear');
		doTweenAlpha('boyfriendFadeEventTween', 'boyfriend', value2, duration, 'linear');
		doTweenAlpha('girlfriendFadeEventTween', 'gf', value2, duration, 'linear');
		doTweenAlpha('iconBoyfriendFadeEventTween', 'iconP1', value2, duration, 'linear');
	end
end