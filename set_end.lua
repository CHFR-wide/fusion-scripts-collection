-- This script will create two keyframes at your playhead's position in order
-- to toggle off the "blend" property of one or multiple nodes.
-- One keyframe is created right before your playhead position with the value of 100, and another
-- one at your playhead with the value of 0.

function len(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
  end
  

cur = comp.CurrentTime

comp:Lock()
for tk, tool in pairs(comp:GetToolList(true)) do
    if tool.Blend ~= nil then
        if tool.Blend:GetConnectedOutput() == nil then
            tool.Blend = comp:BezierSpline({})
        end
        local spline = tool.Blend:GetConnectedOutput():GetTool()
        tool.Blend[cur-1] = 1
        tool.Blend[cur] = 0
        local startPoint = comp:GetAttrs("COMPN_RenderStart")
        spline:DeleteKeyFrames(cur+2, comp:GetAttrs("COMPN_RenderEnd"))
        for kk, keyframe in pairs(tool.Blend:GetKeyFrames()) do
            if tool.Blend[keyframe] == 1 and kk == 2 then
                startPoint = keyframe + 1
            end
        end
        spline:DeleteKeyFrames(startPoint, cur-2)
    end
end
comp:Unlock()
