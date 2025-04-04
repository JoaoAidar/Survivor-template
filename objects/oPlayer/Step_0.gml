var forces = [];

var hInput = keyboard_check(ord("D")) - keyboard_check(ord("A"))
var vInput = keyboard_check(ord("W")) - keyboard_check(ord("S"))

if(hInput != 0 or vInput !=0) {
	var newAngle = Vec2_InputToAngle(hInput, vInput)
	var newForce = Vec2_ScaleVector(Vec2_PolarToCartesian([myVelocity, newAngle]), myMass)
	array_push(forces,newForce) 
} 
var windForce = [-1, 0] 
array_push(forces, windForce)
show_debug_message("Forces: " + string(forces))
myVectors[EntityVectors.Forces] = forces;


myVectors[EntityVectors.NetForce] = Vec2_GetNetForce(myVectors[EntityVectors.Forces])
myVectors[EntityVectors.NetVelocity] = myVectors[EntityVectors.NetForce]
var newPosVec = Vec2_AddCartesian(myVectors[EntityVectors.Position], myVectors[EntityVectors.NetVelocity])
myVectors[EntityVectors.Position] = newPosVec
x = myVectors[EntityVectors.Position][0]
y = myVectors[EntityVectors.Position][1]