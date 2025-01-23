
event_inherited(); // Runs the parent's Step event

var hwidth = sprite_width / 2;
var hheight = sprite_height / 2;

if(!controlled and on_ground) {
	
	if direcction = 1{
	  sprite_index = caballero;
	  image_speed =0.3;
	  image_xscale = 1;	
	}else{
	  sprite_index = caballero;
	  image_speed =0.3;
	  image_xscale = -1;
	}
	

	//deteccion de parametros de colision
	//Le restamos la mitad del alto a la "Y" para que no colisinemos con el suelo 
	if (place_meeting(x + hwidth +move_speed,y - hheight, obj_terrain) and direcction == 1){
	 direcction = 0;
	 show_debug_message("COLLISION CON PARED ADELANTE!");
	}

	if(place_meeting(x- hwidth - move_speed,y - hheight, obj_terrain) and direcction == 0){
	 direcction = 1;	 
	 show_debug_message("COLLISION CON PARED ATRAS!");

	}
	
	if(direcction == 0) {
		x -= move_speed;
	}
	if(direcction == 1) {
		x += move_speed;
	}
} 