// Inherit behavior from the parent event
event_inherited();

// Exit if the player instance does not exist to prevent errors
if (!instance_exists(oPlayer)) exit;

// --- STEP 1: Force Calculation ---
// Clear the forces array for this frame
myVectors[EntityVectors.Forces] = [];

// Calculate the internal (attraction) force that moves the enemy toward the player
var internalForce = Entity_MoveTowardsPoint(id, oPlayer.myVectors[EntityVectors.Position]);

// Add the attraction force to the forces array
array_push(myVectors[EntityVectors.Forces], internalForce);

// Compute the net force from the forces array
myVectors[EntityVectors.NetForce] = Vec2_GetNetForce(myVectors[EntityVectors.Forces]);

// Calculate the net velocity based on the net force and the enemy's mass (Newton's second law)
myVectors[EntityVectors.NetVelocity] = Vec2_ScaleVector(myVectors[EntityVectors.NetForce], 1 / myMass);

// --- STEP 2: Tentative Position Update ---
// Compute a tentative new position by adding the net velocity to the current position
var tentativePos = Vec2_AddCartesian(myVectors[EntityVectors.Position], myVectors[EntityVectors.NetVelocity]);

// --- STEP 3: Axis-Aligned Collision Resolution ---
// Define the minimum allowed separation on each axis
var minDistance =64; // Adjust this value based on your sprite size or desired collision buffer

// Get the player's current position for collision detection
var playerPos = oPlayer.myVectors[EntityVectors.Position];

// Compute the difference vector between the player's position and the tentative enemy position
var diff = Vec2_SubtractCartesian(playerPos, tentativePos);

// Perform an axis-aligned bounding box (AABB) collision check: if both x and y differences are less than minDistance, a collision is occurring
if (abs(diff[0]) < minDistance && abs(diff[1]) < minDistance) {
    
    // Compute the axis-aligned collision normal
    var axisNormal = Vec2_GetAxisCollisionNormal(tentativePos, playerPos);
    
    // --- Positional Correction ---
    // Adjust the tentative position to push the enemy out along the collision axis.
    // If the collision is horizontal, adjust the x coordinate.
    if (axisNormal[0] != 0) {
         // Set enemy's x so that it is exactly minDistance away from the player's x coordinate.
         tentativePos[0] = playerPos[0] - axisNormal[0] * minDistance;
         
         // Nullify horizontal velocity
         myVectors[EntityVectors.NetVelocity][0] = 0;
    }
    // If the collision is vertical, adjust the y coordinate.
    if (axisNormal[1] != 0) {
         tentativePos[1] = playerPos[1] - axisNormal[1] * minDistance;
         
         // Nullify vertical velocity
         myVectors[EntityVectors.NetVelocity][1] = 0;
    }
}

// --- STEP 4: Finalize Position Update ---
// Update the enemy's position vector with the (possibly corrected) tentative position
myVectors[EntityVectors.Position] = tentativePos;

// Set the built-in x and y variables to match the updated position
x = tentativePos[0];
y = tentativePos[1];
