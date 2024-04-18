local nn = ...
local player = PlayerObject()
local mapId = select(8, GetInstanceInfo())
local f = nn:Require('/scripts/tools.lua')

local function MoveTo(pos)
	local succ, err = pcall(function() 
		print('MoveTo Called')
		local curPosition = f.GetPos(player)
		print('CurPos= '..curPosition.X)
		local path = GenerateLocalPath(mapId, curPosition.X, curPosition.Y, curPosition.Z, pos.X, pos.Y, pos.Z, nil,true)
		local index = 2
		if path and #path > 1 then
			print('asdf')
			local function go()
				local waypoint = path[index]
				local curPosition = f.GetPos(player)
				local dist = f.Magnitude(curPosition, pos)
				if index >= #path then
					print("Completed")
					return
				end
				local newX = tonumber(waypoint.x)
				local newY = tonumber(waypoint.y)
				local newZ = tonumber(waypoint.z)
				print("Go to "..newX..' '..newY..' '..' '..newZ)
				ClickToMove(newX, newY, newZ)
				index = index + 1
				C_Timer.After(1, go)
			end

			ClickToMove(tonumber(path[index].x), tonumber(path[index].y), tonumber(path[index].z))
			go()
		end
	end)
	if not succ then
		print('Error: '..err)
	end
end


local function test()
	local os = Objects()
	local curPosition = f.GetPos(player)

    for i=1, #os do
        local o = os[i]
		if f.IsA(o, 'Unit') then
		    local name = ObjectName(o)
			print(name)
			local objectPos = f.GetPos(o)
			local distance = f.Magnitude(curPosition, objectPos)
			--MoveTo(objectPos)
			print('Distance to '..name..' is '..distance)
		end
    end
	--local pos = f.GetPos(os[math.random(1,#os)])
	--MoveTo(pos)
end


--test()
local frame = CreateFrame("Frame", nil, UIParent)
frame:SetPoint("CENTER")
frame:SetSize(200, 400)

frame.tex = frame:CreateTexture()
frame.tex:SetAllPoints(frame)
frame.tex:SetTexture("Interface/DialogFrame/UI-DialogBox-Background")
frame:EnableMouse(true)
frame:SetMovable(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)

-- Создаем первую кнопку
local button1 = CreateFrame("Button", "Button1", frame, "UIPanelButtonTemplate")
button1:SetSize(80, 22)
button1:SetPoint("CENTER", frame, "CENTER", -20, 0)
button1:SetText("")
button1:SetScript("OnClick", function()
    print("Вы нажали на Кнопка 1")
end)

test()
f.suka()