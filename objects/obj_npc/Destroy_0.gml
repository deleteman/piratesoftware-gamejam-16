if (attached_object != noone) {
    attached_object.controlled = true; // Regain control
  //  global.controlled_object = attached_object; // Update control
	attached_object.suelta = true;
	attached_object.vertical_speed = -10;
}