// Randomize text color slightly (e.g., for damage variations)
var color_variation = irandom_range(-20, 20);
var text_color = make_color_hsv(0 + color_variation, 255, 255);

draw_set_color(text_color);
draw_set_alpha(image_alpha); // Apply fade effect

// Draw text with a slight shadow for better readability
draw_text(x + 2, y + 2, string(value)); // Shadow
draw_set_color(c_white);
draw_text(x, y, string(value));         // Actual number

draw_set_alpha(1); // Reset transparency