var collision_npc = instance_place(x, y, obj_npc);
if (collision_npc and suelta) {

// Transfer control to the NPC
	global.controlled_object = collision_npc;
	collision_npc.controlled = true;

	// Attach the initial object to the NPC
	collision_npc.attached_object = id; // Store the initial object
	controlled = false; // The initial object is no longer controlled
	suelta = false;

	
}

if(global.controlled_object.id != collision_npc.id) {

	if(atacando and collision_npc.flicker_timer == 0) {		
		collision_npc.vida_total--;
		collision_npc.empujado = true;
	}
}
