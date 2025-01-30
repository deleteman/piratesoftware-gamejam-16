var hspd = keyboard_check(vk_left) - keyboard_check(vk_right);


if(hspd == 1) {
	image_xscale = -1;
} 
if(hspd == -1) {
	image_xscale = 1;
}
// Gravity
if(!on_ground) {		
	vertical_speed += grv;
}

	// Limit fall speed
if (vertical_speed > max_fall_speed) {
	vertical_speed = max_fall_speed;
}

// Check if there's a tile directly below the player
var floor_below = collision_point(x, y + vertical_speed, obj_terrain, false, false);


if (floor_below) {
	vertical_speed = 0;    // Stop vertical movement
	on_ground = true;      // Mark as on the ground
	JUMPS = 2;
	
} else {
	on_ground = false;

}


switch(status) {
	case "flickering": {
			flicker_timer = game_get_speed(gamespeed_fps);
	
			status = "inmune";
		break;	
	}
}

if (suelta) {
	
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
	image_speed = 0;
	
} else { //si no estamos controlando a la espada directamente

	// Initialize the animation speed (frames per step)
	var animation_speed = 1; 

	// Check if spacebar is pressed
	if (keyboard_check_pressed(vk_enter)) { //attack!
	    image_speed = animation_speed; // Start animating
		atacando = true;
	}

	// Check if the animation has completed
	if (image_index >= sprite_get_number(sprite_index) - 1 && image_speed > 0) {
	    image_speed = 0;         // Stop the animation
	    image_index = 0;         // Reset to the first frame
		atacando = false;
	}
}
	
if((vertical_speed > 0) or
   (vertical_speed < 0 and !collision_point(x, y + vertical_speed, obj_terrain, false, false))
){
	y += vertical_speed;
}	