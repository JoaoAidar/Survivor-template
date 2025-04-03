myVelocity = 10;
myName = "Player"
myVectors[EntityVectors.Position] = [x,y]
myVectors[EntityVectors.Velocity] = [0,0]
myId = id
myVectorVisualScalingFactor = 10

var myBow = instance_create_depth(x,y,depth,oBow)
var _myId = myId
with(myBow) {myOwner = _myId}