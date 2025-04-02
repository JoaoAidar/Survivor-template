function Vec2_AddPolar(_vec01, _vec02){ 
	var vec1 = _vec01
	var vec2 = _vec02
	var r1 = vec1[0]
	var r2 = vec2[0] 
	var theta1 = vec2[1] 
	var theta2 = vec2[1]
	var rr, thetar;
	
	rr = sqrt(r1*r1 + r2*r2 + 2*r1*r2*dcos(theta2 - theta1));
	thetar = theta1 + arctan2(r2*dsin(theta2 - theta1), r1 + r2*dcos(theta2 - theta1))
	
	return [rr, thetar]
}

function Vec2_InputToAngle(_hInput, _vInput)
{ 
	return darctan2(_vInput, _hInput)		
}
function Vec2_PolarToCartesian(_pol01){
	var returnX = lengthdir_x(_pol01[0], _pol01[1])
	var returnY = lengthdir_y(_pol01[0], _pol01[1])
	
	return [returnX, returnY]
}

function Vec2_ScaleVector(_vec01, _scaleFactor) {
	return [_vec01[0]*_scaleFactor, _vec01[1]*_scaleFactor]
}
function Vec2_AddCartesian(_vec01, _vec02){
	var returnX = _vec01[0] + _vec02[0]
	var returnY = _vec01[1] + _vec02[1]
	
	return [returnX, returnY];
}

function Vec2_Polar_getMagnitudeX(_polarVec){
	var polVec = _polarVec
	return lengthdir_x(polVec[0],polVec[1])
}

function Vec2_Polar_getMagnitudeY(_polarVec){
	var polVec = _polarVec
	return lengthdir_y(polVec[0],polVec[1])
}