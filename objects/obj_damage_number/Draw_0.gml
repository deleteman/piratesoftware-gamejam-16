draw_set_color(c_white); // Set the text color (change to whatever you want)
draw_set_alpha(image_alpha); // Apply transparency
draw_text(x, y, string(value)); // Draw the floating number
draw_set_alpha(1); // Reset transparency to normal
