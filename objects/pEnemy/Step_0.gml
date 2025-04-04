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



myVectors[EntityVectors.Position] = [x,y]