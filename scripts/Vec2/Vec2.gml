// Adds two vectors in polar coordinates
function Vec2_AddPolar(_vec01, _vec02) { 
    var vec1 = _vec01;
    var vec2 = _vec02;
    var r1 = vec1[0];
    var r2 = vec2[0]; 
    var theta1 = vec1[1]; 
    var theta2 = vec2[1];
    var rr, thetar;
    
    // Law of cosines for magnitude
    rr = sqrt(r1*r1 + r2*r2 + 2*r1*r2*dcos(theta2 - theta1));
    
    // Resulting angle using arctangent
    thetar = theta1 + arctan2(r2 * dsin(theta2 - theta1), r1 + r2 * dcos(theta2 - theta1));
    
    return [rr, thetar];
}

// Gets the net force from an array of vectors in cartesian form
function Vec2_GetNetForce(_vecArray) {
    var netForce = [0, 0];
    if (array_length(_vecArray) == 0) return netForce;

    var arLen = array_length(_vecArray);
    
    for (var i = 0; i < arLen; i++) {
        netForce = Vec2_AddCartesian(netForce, _vecArray[i]);
    }
    
    return netForce;
}

// Converts horizontal and vertical input to an angle
function Vec2_InputToAngle(_hInput, _vInput) { 
    return darctan2(_vInput, _hInput);		
}

// Converts polar coordinates to cartesian (x, y)
function Vec2_PolarToCartesian(_pol01) {
    var returnX = lengthdir_x(_pol01[0], _pol01[1]);
    var returnY = lengthdir_y(_pol01[0], _pol01[1]);
    
    return [returnX, returnY];
}

// Converts cartesian coordinates to polar (r, theta)
function Vec2_CartesianToPolar(_car01) {
    var rr = 0;
    var rtheta = 0;
    var cartX = _car01[0];
    var cartY = _car01[1];
    
    rr = sqrt(cartX * cartX + cartY * cartY); 
    rtheta = darctan2(cartY, cartX);

    return [rr, rtheta];	
}

// Scales a vector by a scalar
function Vec2_ScaleVector(_vec01, _scaleFactor) {
    return [_vec01[0] * _scaleFactor, _vec01[1] * _scaleFactor];
}

// Computes the scalar (dot) product of two vectors
function Vec2_ScalarProduct(_vec01, _vec02) {
    return _vec01[0] * _vec02[0] + _vec01[1] * _vec02[1];
}

// Gets the length (magnitude) of a vector in cartesian form
function Vec2_LengthCartesian(_vector) {
    return sqrt(sqr(_vector[0]) + sqr(_vector[1]));
}

// Adds two cartesian vectors
function Vec2_AddCartesian(_vec01, _vec02) {
    var returnX = _vec01[0] + _vec02[0];
    var returnY = _vec01[1] + _vec02[1];
    
    return [returnX, returnY];
}

// Subtracts one cartesian vector from another
function Vec2_SubtractCartesian(_vecA, _vecB) {
    return [_vecA[0] - _vecB[0], _vecA[1] - _vecB[1]];
}

// Gets the x-component of a polar vector
function Vec2_Polar_getMagnitudeX(_polarVec) {
    var polVec = _polarVec;
    return lengthdir_x(polVec[0], polVec[1]);
}

// Gets the y-component of a polar vector
function Vec2_Polar_getMagnitudeY(_polarVec) {
    var polVec = _polarVec;
    return lengthdir_y(polVec[0], polVec[1]);
}

// Draws a vector from an origin with a scaling factor applied
function Vec2_DrawVector(_origin, _vector, _scalingFactor) {
    _vector = Vec2_ScaleVector(_vector, _scalingFactor);
    var vector = Vec2_AddCartesian(_origin, _vector);
    
    draw_arrow(_origin[0], _origin[1], vector[0], vector[1], 6);
}

// Draws all vectors in an array as force vectors
function Vec2_DrawForceVectors(_vecArray) {
    if (array_length(_vecArray) == 0) exit;
    
    show_debug_message(_vecArray);
    
    var arLen = array_length(_vecArray);
    
    for (var i = 0; i < arLen; i++) {
        draw_set_color(c_green);
        Vec2_DrawVector(myVectors[EntityVectors.Position], _vecArray[i], myVectorVisualScalingFactor);
        draw_set_color(c_white);
        show_debug_message("Drawing vector: " + string(i));
    }
}
/// Vec2_GetAxisCollisionNormal
/// @description Returns an axis‐aligned collision normal vector between two positions.
/// If the absolute difference in X is greater than Y, the collision is considered horizontal;
/// otherwise, it’s vertical. The normal is a unit vector pointing along the axis of collision.
/// @param _posA The first entity's position vector [x, y]
/// @param _posB The second entity's position vector [x, y]
/// @return A collision normal vector; for horizontal collisions: [sign(diff.x), 0],
///         and for vertical collisions: [0, sign(diff.y)]
function Vec2_GetAxisCollisionNormal(_posA, _posB) {
    // Calculate the difference vector from entity A to B.
    var diff = Vec2_SubtractCartesian(_posB, _posA);
    
    // Determine the collision axis based on the larger absolute difference.
    if (abs(diff[0]) > abs(diff[1])) {
        // Horizontal collision: normal points left or right.
        return [sign(diff[0]), 0];
    } else {
        // Vertical collision: normal points up or down.
        return [0, sign(diff[1])];
    }
}

/// Vec2_ResolveCollisionVelocity
/// @description Adjusts a given velocity vector by nullifying the component along the collision normal.
/// This prevents movement along the axis where the collision occurred.
/// @param _velocity The current velocity vector [vx, vy]
/// @param _normal The collision normal vector from Vec2_GetAxisCollisionNormal.
/// @return The modified velocity vector with movement along the collision axis removed.
function Vec2_ResolveCollisionVelocity(_velocity, _normal) {
    // Create a copy of the velocity vector.
    var resolvedVelocity = _velocity;
    
    // If the collision is horizontal, set the x component to 0.
    if (_normal[0] != 0) {
        resolvedVelocity[0] = 0;
    }
    // If the collision is vertical, set the y component to 0.
    if (_normal[1] != 0) {
        resolvedVelocity[1] = 0;
    }
    
    return resolvedVelocity;
}
