/// @description movimiento
event_inherited(); // Runs the parent's Step event

var hwidth = sprite_width / 2;
var hheight = sprite_height / 2;

if(!controlled and on_ground) {
	//show_debug_message("MOVING ALONE!");
	
	if direcction = 1{
	  sprite_index = caballero;
	  image_speed =0.3;
	  image_xscale = 1;	
	}else{
	  sprite_index = caballero;
	  image_speed =0.3;
	  image_xscale = -1;
	}
	
	switch(estado) {
		case "patrol": {			
			if(collision_point(x +1, y-hheight, obj_terrain, false, false) and direcction == 1) {
				direcction = 0;
			}
	
			if(collision_point(x - 1, y - hheight, obj_terrain, false, false) and direcction == 0) {
				direcction = 1;
			}
	
	
			if(direcction == 0) {
				x -= move_speed;
			}
			if(direcction == 1) {
				x += move_speed;
			}
			break;
		}
	}
	
	
}