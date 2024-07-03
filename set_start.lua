-- This script will create two keyframes at your playhead's position in order
-- to toggle on the "blend" property of one or multiple nodes.
-- One keyframe is created at playhead position with the value of 100, and another
-- one frame earlier at the value of 0.

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
        tool.Blend[cur-1] = 0
        tool.Blend[cur] = 1
        local stopPoint = comp:GetAttrs("COMPN_RenderEnd")
        spline:DeleteKeyFrames(0, cur-2)
        for kk, keyframe in pairs(tool.Blend:GetKeyFrames()) do
            if tool.Blend[keyframe] == 1 and kk == len(tool.Blend:GetKeyFrames()) - 1 then
                stopPoint = keyframe-1
            end
        end
        spline:DeleteKeyFrames(cur+1, stopPoint)
    end
end
comp:Unlock()