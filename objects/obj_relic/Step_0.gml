// Horizontal movement
if (keyboard_check(vk_left)) {
    x -= move_speed;
}
if (keyboard_check(vk_right)) {
    x += move_speed;
}

// Gravity
vertical_speed += gravity;

// Jumping
if (on_ground && keyboard_check_pressed(vk_space)) {
    vertical_speed = jump_strength;
    on_ground = false;
}

// Apply vertical speed
y += vertical_speed;

// Limit fall speed
if (vertical_speed > max_fall_speed) {
    vertical_speed = max_fall_speed;
}

// Small jump when moving
if (!on_ground && (keyboard_check(vk_left) || keyboard_check(vk_right))) {
    vertical_speed = -2; // Smaller jump effect
}