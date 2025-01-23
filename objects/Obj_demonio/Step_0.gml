/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if distance_to_object(obj_relic) < 120
 {
	 if point_direction(x,y,obj_relic.x,obj_relic.y)>360 &&  point_direction(x,y, obj_relic.x, obj_relic.y)>360
	 {
		 move_towards_point(obj_relic.x,obj_relic.y,6);
	 }
 }