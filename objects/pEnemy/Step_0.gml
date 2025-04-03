// Inherit the parent event
event_inherited();
if(!instance_exists(oPlayer)) exit;
myVectors[EntityVectors.Velocity] = Entity_MoveTowardsPoint(id,oPlayer.myVectors[EntityVectors.Position])
var newPos = Vec2_AddCartesian(myVectors[EntityVectors.Position], myVectors[EntityVectors.Velocity])

x = newPos[0]
y = newPos[1] 

myVectors[EntityVectors.Position] = [x,y]