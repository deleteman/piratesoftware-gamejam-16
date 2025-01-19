var tilemap = layer_tilemap_get_id("terreno");
var hspd = keyboard_check(vk_left) - keyboard_check(vk_right);

// Horizontal movement
if (keyboard_check(vk_left)) {
    x -= move_speed;
}
if (keyboard_check(vk_right)) {
    x += move_speed;
}

// Gravity
if(!on_ground) {		
	vertical_speed += grv;
}

//y = floor(y / 64) * 64 // Snap to grid

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


show_debug_message("FLOOR: {0}", floor_below);
show_debug_message("H SPEED: {0}", hspd);
show_debug_message("ON GROUND:{0}", on_ground);
// Apply vertical speed
y += vertical_speed;
