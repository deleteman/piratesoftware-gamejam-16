
if (attached_object != noone) {
    attached_object.x = x; // Keep the initial object attached to the NPC
    attached_object.y = y - sprite_height / 2; // Adjust for position
	if(obj_relic.ref_ojos != noone) {
		obj_relic.ref_ojos.x = x;
		obj_relic.ref_ojos.y = y;
		obj_relic.ref_ojos.image_alpha = 1;
	}
}

var hspd = keyboard_check(vk_left) - keyboard_check(vk_right);


if(hspd == 1) {
	image_xscale = -1;
} 
if(hspd == -1) {
	image_xscale = 1;
}

var hwidth = sprite_width / 2;
var hheight = sprite_height / 2;

// Gravity
if(!on_ground) {		
	vertical_speed += grv;
}

if(vida_total <= 0) {
	instance_destroy(self);
}

// Limit fall speed
if (vertical_speed > max_fall_speed) {
	vertical_speed = max_fall_speed;
}

//var floor_below = tilemap_get_at_pixel(tilemap, x, y + vertical_speed + sprite_height);
var floor_below = collision_point(x, y + vertical_speed, obj_terrain, false, false);

// Check if there's a tile directly below the player

if (floor_below) {
	vertical_speed = 0;    // Stop vertical movement
	on_ground = true;      // Mark as on the ground
	JUMPS = 2; //reset value
} else {
	on_ground = false;
}


switch(estado) {
	case "golpeado": {
		move_speed = 0;
		vertical_speed = -5;

		estado = "empujado";
		//direccion del empujado
		if(obj_relic.x <= x) PUSH_FORCE = PUSH_FORCE * -1;

		show_debug_message("GOLEPADO!");
		alarm[0] = 50; //el NPC se detiene por este tiempo
		flicker_timer = game_get_speed(gamespeed_fps);
		var num = instance_create_layer(x, y - sprite_height / 2, "Effects", obj_damage_number);
	    num.value = DMG_RECEIVED; // Set the value to the damage dealt
		vida_total -= DMG_RECEIVED;
		
		
		break;
	}
	case "empujado": {
		alarm[1] = 50;
		
		if(alarm[1] > 0) {
			
			var dir = 1;
			if(obj_relic.x < x) dir = -1;
			if(!collision_point(x + (PUSH_FORCE * dir), y - 10, obj_terrain, false, false)) {
				x += PUSH_FORCE * dir;
			}
		} else {
			estado = "recuperado";	
		}
		break;
	}
	case "recuperando": {
		move_speed = 1;
		hspeed = 0;
		estado = "patrol";
		break;
	}
}


if (controlled) { //si lo controlamos nosotros
	var next_to_wall_right = collision_point(x + move_speed, y - 2, obj_terrain, false, false);
	var next_to_wall_left = collision_point(x - move_speed,y - 2, obj_terrain, false, false);
	
	
 	
	// Horizontal movement
	if (keyboard_check(vk_left) && !next_to_wall_left ) {
	    x -= move_speed;
	}
	if (keyboard_check(vk_right) && !next_to_wall_right) {
	    x += move_speed;
	}

	// Small jump when moving
	if (on_ground && (keyboard_check(vk_left) || keyboard_check(vk_right)) && !(next_to_wall_right ||next_to_wall_left)) {
	    vertical_speed = -2; // Smaller jump effect
	}
	// Jumping
	if ((on_ground || (hspd !=0)) && keyboard_check_pressed(vk_space) && JUMPS > 0) {
		show_debug_message("TRYING TO JUMP");
	    vertical_speed = jump_strength;
	    on_ground = false;
		JUMPS--;
	}
}

if((vertical_speed > 0) or
   (vertical_speed < 0 and !collision_point(x, y + vertical_speed, obj_terrain, false, false))
){
	y += vertical_speed;
}
