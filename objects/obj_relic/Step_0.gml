var hspd = keyboard_check(vk_left) - keyboard_check(vk_right);


// Gravity
if(!on_ground) {		
	vertical_speed += grv;
}

	// Limit fall speed
if (vertical_speed > max_fall_speed) {
	vertical_speed = max_fall_speed;
}

var floor_below = place_meeting(x, y + 1, obj_terrain);

// Check if there's a tile directly below the player

if (floor_below) {
	vertical_speed = 0;    // Stop vertical movement
	on_ground = true;      // Mark as on the ground
} else {
	on_ground = false;
}



if (global.controlled_object == id) {

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
	image_speed = 0;
	
} else { //si no estamos controlando a la espada directamente

	// Initialize the animation speed (frames per step)
	var animation_speed = 1; // Play all frames in 1 second

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
	
	
	y += vertical_speed;
