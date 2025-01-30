/// @description movimiento
event_inherited(); // Runs the parent's Step event

var hwidth = sprite_width / 2;
var hheight = sprite_height / 2;

if(!controlled and on_ground) {
	
	if direcction = 1{
	  sprite_index = mostruo;
	  image_speed =0.3;
	  image_xscale = 1;	
	}else{
	  sprite_index = mostruo;
	  image_speed =0.3;
	  image_xscale = -1;
	}
	
	switch(estado) {
		case "patrol": {
			
			if(collision_point(x + move_speed, y-3, obj_terrain, false, false) and direcction == 1) {
				direcction = 0;
			}
	
			if(collision_point(x - move_speed, y - 3, obj_terrain, false, false) and direcction == 0) {
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