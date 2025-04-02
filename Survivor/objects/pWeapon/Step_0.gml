if(!instance_exists(myOwner)) exit;
var ownerPos = [myOwner.x, myOwner.y]

myRotationAngle+=1
var newPos = Entity_orbitAroundPosition(ownerPos, 50, myRotationAngle)
x = newPos[0]
y = newPos[1]