function Entity_orbitAroundPosition(_centerPositionVector, _orbitRadius, _orbitAngle){
	var orbitCenter = _centerPositionVector	
	var radius = _orbitRadius
	var angle = _orbitAngle

	var dx = Vec2_Polar_getMagnitudeX([radius, angle])
	var dy = Vec2_Polar_getMagnitudeY([radius, angle])
	
	var newPos = Vec2_AddCartesian(orbitCenter, [dx, dy])
	return newPos
}