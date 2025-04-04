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

function Vec2_GetNetForce(_vecArray) {
	var netForce = [0,0]
	if(array_length(_vecArray) == 0) return netForce
	var arLen = array_length(_vecArray) 
	
	for(var i = 0; i < arLen; i++) {
		netForce = Vec2_AddCartesian(netForce, _vecArray[i])
	}
	
	return netForce
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

function Vec2_CartesianToPolar(_car01){
	var rr = 0;
	var rtheta = 0;
	var cartX = _car01[0]
	var cartY = _car01[1]
	
	rr = sqrt(cartX*cartX + cartY*cartY) 
	rtheta = darctan2(cartY, cartX)

	return [rr, rtheta]	
}

function Vec2_ScaleVector(_vec01, _scaleFactor) {
	return [_vec01[0]*_scaleFactor, _vec01[1]*_scaleFactor]
}

function Vec2_ScalarProduct(_vec01, _vec02){
	
}
function Vec2_LengthCartesian(_vector){
	return sqrt(sqr(_vector[0]) + sqr(_vector[1]))
}

function Vec2_AddCartesian(_vec01, _vec02){
	var returnX = _vec01[0] + _vec02[0]
	var returnY = _vec01[1] + _vec02[1]
	
	return [returnX, returnY];
}
function Vec2_SubtractCartesian(_vecA, _vecB) {
    return [_vecA[0] - _vecB[0], _vecA[1] - _vecB[1]];
}

function Vec2_Polar_getMagnitudeX(_polarVec){
	var polVec = _polarVec
	return lengthdir_x(polVec[0],polVec[1])
}

function Vec2_Polar_getMagnitudeY(_polarVec){
	var polVec = _polarVec
	return lengthdir_y(polVec[0],polVec[1])
}

function Vec2_DrawVector(_origin, _vector, _scalingFactor)
{
	//show_debug_message("Origin: " + string(_origin))
	//show_debug_message("Vector: " + string(_vector))
	
	
	_vector = Vec2_ScaleVector(_vector, _scalingFactor)
	var vector = Vec2_AddCartesian(_origin,_vector)
	draw_arrow(_origin[0], _origin[1], vector[0], vector[1],6)
	
}