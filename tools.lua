local func = {}

local types = {
    Object = 0,
    Item = 1,
    Container = 2,
    AzeriteEmpoweredItem = 3,
    AzeriteItem = 4,
    Unit = 5,
    Player = 6,
    ActivePlayer = 7,
    GameObject = 8,
    DynObject = 9,
    Corpse = 10,
    AreaTrigger = 11,
    SceneObject = 12,
    Conversation = 13
}


function func.GetPos(obj)
	local x,y,z = ObjectPosition(obj)
	local data = {
		X = x;
		Y = y;
		Z = z;
	}
	return data
end

function func.IsA(obj, typ)
	return ObjectType(obj) == types[typ]
end

function func.Magnitude(origin, dist)
	local x1 = origin.X
	local y1 = origin.Y
	local z1 = origin.Z
	local x2 = dist.X
	local y2 = dist.Y
	local z2 = dist.Z
	local dx = x2 - x1
	local dy = y2 - y1
	local dz = z2 - z1
	return math.sqrt(dx*dx + dy*dy + dz*dz)
end

function func.suka()
 print('asdasd')
end

return func