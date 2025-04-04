function Entity_orbitAroundPosition(_centerPositionVector, _orbitRadius, _orbitAngle){
	var orbitCenter = _centerPositionVector	
	var radius = _orbitRadius
	var angle = _orbitAngle

	var dx = Vec2_Polar_getMagnitudeX([radius, angle])
	var dy = Vec2_Polar_getMagnitudeY([radius, angle])
	
	var newPos = Vec2_AddCartesian(orbitCenter, [dx, dy])
	return newPos
}

function Entity_MoveTowardsPoint(_id, _goalPosVector) {
    var ID = _id;
    var curPos = ID.myVectors[EntityVectors.Position];
    var posGoal = _goalPosVector;
    
    //show_debug_message("Current position: " + string(curPos));
   // show_debug_message("Goal position: " + string(posGoal));
    
    // Compute the direction vector from current to goal
    var directionVec = Vec2_SubtractCartesian(posGoal, curPos);
    //show_debug_message("Direction vector: " + string(directionVec));
    
    // Get the magnitude of the direction vector
    var magnitude = Vec2_LengthCartesian(directionVec);
    
    // Normalize the direction vector (if magnitude is non-zero)
    var normalizedDir;
    if (magnitude != 0) {
        normalizedDir = [directionVec[0] / magnitude, directionVec[1] / magnitude];
    } else {
        normalizedDir = [0, 0];
    }
    
    // Multiply the normalized vector by the desired speed (ID.myVelocity)
    var desiredSpeed = ID.myVelocity;
    var newVelocity = Vec2_ScaleVector(normalizedDir, desiredSpeed);
    //show_debug_message("New velocity: " + string(newVelocity));
    
    return newVelocity;
}
