if (attached_object != noone) {
    attached_object.x = x; // Keep the initial object attached to the NPC
    attached_object.y = y - sprite_height / 2; // Adjust for position
}

var hspd = keyboard_check(vk_left) - keyboard_check(vk_right);

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
var floor_below = place_meeting(x, y + 1, obj_terrain);

// Check if there's a tile directly below the player

if (floor_below) {
	vertical_speed = 0;    // Stop vertical movement
	on_ground = true;      // Mark as on the ground
} else {
	on_ground = false;
}

if(empujado) {
	vertical_speed = -10;
	empujado = false;
	flicker_timer = game_get_speed(gamespeed_fps);
}

if (controlled) { //si lo controlamos nosotros

	// Horizontal movement
	if (keyboard_check(vk_left)) {
	    x -= move_speed;
	}
	if (keyboard_check(vk_right)) {
	    x += move_speed;
	}

	// Small jump when moving
	if (on_ground && (keyboard_check(vk_left) || keyboard_check(vk_right))) {
	    vertical_speed = -2; // Smaller jump effect
	}
	// Jumping
	if ((on_ground || (hspd !=0)) && keyboard_check_pressed(vk_space)) {
		show_debug_message("TRYING TO JUMP");
	    vertical_speed = jump_strength;
	    on_ground = false;
	}


	// Apply vertical speed
	
	
}
y += vertical_speed;