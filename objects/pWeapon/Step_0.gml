// Exit if the owner object doesn't exist
if (!instance_exists(myOwner)) exit;

// Get the current position of the owner
var ownerPos = [myOwner.x, myOwner.y];

// Get the velocity vector of the owner
var ownerVelocity = myOwner.myVectors[EntityVectors.NetVelocity];

// Increment the rotation angle
myExternalRotationAngle += 1;
image_angle = myExternalRotationAngle;

// Calculate the owner's predicted position based on its velocity
var ownerPredictedPos = Vec2_AddCartesian(ownerPos, ownerVelocity);

// Calculate the new orbiting position around the predicted position
var newPos = Entity_orbitAroundPosition(ownerPredictedPos, 50, myExternalRotationAngle);

// Update this entity's position and velocity vectors
myVectors[EntityVectors.Position] = newPos;
myVectors[EntityVectors.NetVelocity] = Vec2_PolarToCartesian([myVelocity, myExternalRotationAngle])

// Update the actual x,y coordinates
x = newPos[0];
y = newPos[1];