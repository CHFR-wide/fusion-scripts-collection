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
