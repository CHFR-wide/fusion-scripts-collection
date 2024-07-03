-- This script saves your playhead's position and starts playback, 
-- then moves it back to its start position when you activate it again.

local savedTime = fusion:GetData("savedTime")
if savedTime == nil then
    fusion:SetData("savedTime", comp.CurrentTime)
    comp:Play()
else
    comp:Stop()
    while comp.CurrentTime ~= savedTime do
        comp.CurrentTime = savedTime
    end
    fusion:SetData("savedTime", nil)
end
