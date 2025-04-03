draw_self()
var dirPointerCartesian = Vec2_PolarToCartesian([myRange, myExternalRotationAngle])
Vec2_DrawVector(myVectors[EntityVectors.Position],dirPointerCartesian, 1)