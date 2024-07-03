dial = comp:AskUser("Set BPM", {
    {"BPM", "Slider", Default=120},
    {"Beats", "Slider", Default=4},
    {"Offset", "Slider", Default=0},
})

fusion:SetData("BPMInfos.BPM", dial.BPM)
fusion:SetData("BPMInfos.Beats", dial.Beats)
fusion:SetData("BPMInfos.Offset", dial.Offset)