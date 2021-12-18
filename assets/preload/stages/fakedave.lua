function onCreate()
	-- background shit
     	makeLuaSprite('backs', 'dave/sky_night', -150, 40);
	setLuaSpriteScrollFactor('backs', 0.9, 0.9); 
	addLuaSprite('backs', false);   
	addLuaSprite('back', false);
	makeLuaSprite('back1', 'dave/hills', -150, 40);
	setLuaSpriteScrollFactor('back1', 0.9, 0.9);         
	addLuaSprite('back1', false);
	makeLuaSprite('back2', 'dave/grass', -150, 60);
	setLuaSpriteScrollFactor('back2', 0.9, 0.9);         
	addLuaSprite('back2', false);
	makeLuaSprite('back', 'dave/gate', -150, 40);
	setLuaSpriteScrollFactor('back', 0.9, 0.9); 
	addLuaSprite('back', false);   
	makeLuaSprite('back12', 'dave/cornoverlay', -280, -300); 
	setLuaSpriteScrollFactor('back1', 1, 1);         
	addLuaSprite('back12', true);
  	setObjectOrder('back12', 25)
 	setObjectCamera('back12', "other")

end

local u = false;
local r = 0;
local xx = 600;
local yy = 550;
local xx2 = 850;
local yy2 = 550;
local ofs = 33;
local followchars = true;
local del = 0;
local del2 = 0;

function onUpdate(elapsed)
if del > 0 then
del = del - 1
end
if del2 > 0 then
del2 = del2 - 1
end
if followchars == true then
if mustHitSection == false then
if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
triggerEvent('Camera Follow Pos',xx-ofs,yy)
end
if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
triggerEvent('Camera Follow Pos',xx+ofs,yy)
end
if getProperty('dad.animation.curAnim.name') == 'singUP' then
triggerEvent('Camera Follow Pos',xx,yy-ofs)
end
if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
triggerEvent('Camera Follow Pos',xx,yy+ofs)
end
if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
triggerEvent('Camera Follow Pos',xx-ofs,yy)
end
if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
triggerEvent('Camera Follow Pos',xx+ofs,yy)
end
if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
triggerEvent('Camera Follow Pos',xx,yy-ofs)
end
if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
triggerEvent('Camera Follow Pos',xx,yy+ofs)
end
if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
triggerEvent('Camera Follow Pos',xx,yy)
end
if getProperty('dad.animation.curAnim.name') == 'idle' then
triggerEvent('Camera Follow Pos',xx,yy)
end
else
if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
end
if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
end
if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
end
if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
end
if getProperty('boyfriend.curAnim.name') == 'idle-alt' then
triggerEvent('Camera Follow Pos',xx2,yy2)
end
if getProperty('boyfriend.curAnim.name') == 'idle' then
triggerEvent('Camera Follow Pos',xx2,yy2)
end
end
else
triggerEvent('Camera Follow Pos','','')
end
end