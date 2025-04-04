draw_self();

Vec2_DrawVector(myVectors[0], myVectors[EntityVectors.NetVelocity], myVectorVisualScalingFactor);

function Vec2_DrawForceVectors(_vecArray) {
	if(array_length(_vecArray) == 0) exit;
	show_debug_message(_vecArray)
	var arLen = array_length(_vecArray) 
	
	for(var i = 0; i < arLen; i++) {
		draw_set_color(c_green)
		Vec2_DrawVector(myVectors[0], _vecArray[i], myVectorVisualScalingFactor)
		draw_set_color(c_white)
		show_debug_message("Drawing vector:" + string(i))
	}
}

show_debug_message("Net: " + string(myVectors[EntityVectors.NetForce]))
Vec2_DrawVector(myVectors[EntityVectors.Position], myVectors[EntityVectors.NetForce], myVectorVisualScalingFactor)
Vec2_DrawForceVectors(myVectors[EntityVectors.Forces])