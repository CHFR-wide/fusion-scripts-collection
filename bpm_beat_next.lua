-- This script moves your playhead forward one beat from the infos entered in bpm_set_bpm.lua

BPMInfos = fusion:GetData("BPMInfos")

if BPMInfos ~= nil then
    local currentTime = comp.CurrentTime;
    local target = BPMInfos.Offset;
    local frameRate = comp:GetPrefs().Comp.FrameFormat.Rate;
    local beatLength = frameRate / (BPMInfos.BPM / 60);
    while math.floor(target) <= currentTime do
        target = target + beatLength;
    end
    comp.CurrentTime = math.floor(target)
end