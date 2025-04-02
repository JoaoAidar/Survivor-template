draw_self();

function Vec2_DrawVector(_origin, _vector, _scalingFactor)
{
	show_debug_message("Origin: " + string(_origin))
	show_debug_message("Vector: " + string(_vector))
	
	
	_vector = Vec2_ScaleVector(_vector, _scalingFactor)
	var vector = Vec2_AddCartesian(_origin,_vector)
	draw_arrow(_origin[0], _origin[1], vector[0], vector[1], 3)
	
}
Vec2_DrawVector(myVectors[0], myVectors[EntityVectors.Velocity], myVectorVisualScalingFactor);