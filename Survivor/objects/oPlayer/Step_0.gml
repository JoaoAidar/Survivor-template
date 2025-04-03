

var hInput = keyboard_check(ord("D")) - keyboard_check(ord("A"))
var vInput = keyboard_check(ord("W")) - keyboard_check(ord("S"))
var newVelocity;
if(hInput != 0 or vInput !=0) {
	var newAngle = Vec2_InputToAngle(hInput, vInput)
	newVelocity = Vec2_PolarToCartesian([myVelocity, newAngle])
	//show_debug_message("New velocity:" + string(newVelocity)) 
} else { 
	newVelocity = [0,0]	
}
for(var i = 1; i < EntityVectors.length -1; i++){
		newVelocity = Vec2_AddCartesian(newVelocity, myVectors[i])
}
var pos = myVectors[EntityVectors.Position]
var newPos = Vec2_AddCartesian(pos, newVelocity)
x = newPos[0]
y = newPos[1]
myVectors[EntityVectors.Velocity] = newVelocity
myVectors[EntityVectors.Position] = newPos
