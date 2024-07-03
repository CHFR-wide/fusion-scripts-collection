BPMInfos = fusion:GetData("BPMInfos")

if BPMInfos ~= nil and comp.CurrentTime > 0 then
    local currentTime = comp.CurrentTime;
    local target = BPMInfos.Offset;
    local frameRate = comp:GetPrefs().Comp.FrameFormat.Rate;
    local beatLength = frameRate / (BPMInfos.BPM / 60);
    local lastValue = nil
    while math.floor(target) < currentTime do
        lastValue = target;
        target = target + beatLength;
    end
    comp.CurrentTime = math.floor(lastValue)
end