var collision_npc = instance_place(x, y, obj_npc);

if(global.controlled_object && global.controlled_object.id == collision_npc.id) {
	if(ref_ojos == noone) {
		ref_ojos = instance_create_layer(x, y, "Effects", obj_ojos);
	}
}

if (collision_npc and suelta and status != "inmune") { //colision con un npc mientras la espada está sola

// Transfer control to the NPC
	global.controlled_object = collision_npc;
	collision_npc.controlled = true;

	// Attach the initial object to the NPC
	collision_npc.attached_object = id; // Store the initial object
	controlled = false; // The initial object is no longer controlled
	suelta = false;

	
}

