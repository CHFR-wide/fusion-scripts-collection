-- This script saves BPM infos, to be used with bpm_beat_next.lua and bpm_beat_prev.lua

dial = comp:AskUser("Set BPM", {
    {"BPM", "Slider", Default=120},
    {"Beats", "Slider", Default=4},
    {"Offset", "Slider", Default=0},
})

fusion:SetData("BPMInfos.BPM", dial.BPM)
fusion:SetData("BPMInfos.Beats", dial.Beats)
fusion:SetData("BPMInfos.Offset", dial.Offset)