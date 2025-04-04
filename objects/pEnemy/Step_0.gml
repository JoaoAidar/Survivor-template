// Inherit the parent event
event_inherited();
if(!instance_exists(oPlayer)) exit;
myVectors[EntityVectors.Forces] = [];
var internalForce = Entity_MoveTowardsPoint(id,oPlayer.myVectors[EntityVectors.Position])

array_push(myVectors[EntityVectors.Forces], internalForce) 
array_push(myVectors[EntityVectors.Forces], [-1,0])
myVectors[EntityVectors.NetVelocity] = Vec2_GetNetForce(myVectors[EntityVectors.Forces])
var newPos = Vec2_AddCartesian(myVectors[EntityVectors.Position], myVectors[EntityVectors.NetVelocity])

x = newPos[0]
y = newPos[1] 

function Vec2_GetNetForce(_vecArray) {
	var netForce = [0,0]
	if(array_length(_vecArray) == 0) return netForce
	var arLen = array_length(_vecArray) 
	
	for(var i = 0; i < arLen; i++) {
		netForce = Vec2_AddCartesian(netForce, _vecArray[i])
	}
	
	return netForce
}

myVectors[EntityVectors.Position] = [x,y]