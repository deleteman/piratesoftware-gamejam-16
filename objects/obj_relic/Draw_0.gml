if (flicker_timer > 0) {
    if (floor(flicker_timer / flicker_interval) mod 2 == 0) {
        draw_set_color(c_red); // Flash red
        draw_self();
        draw_set_color(c_white); // Reset color
    }
    flicker_timer--;
} else {
	if(status == "inmune") status = ""; //reset status
    draw_self();
}

