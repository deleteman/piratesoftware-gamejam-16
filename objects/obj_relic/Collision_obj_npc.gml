var collision_npc = instance_place(x, y, obj_npc);
if (collision_npc and suelta) { //colision con un npc mientras la espada está sola

// Transfer control to the NPC
	global.controlled_object = collision_npc;
	collision_npc.controlled = true;

	// Attach the initial object to the NPC
	collision_npc.attached_object = id; // Store the initial object
	controlled = false; // The initial object is no longer controlled
	suelta = false;

	
}

if(global.controlled_object.id != collision_npc.id) { //colisión con un NPC que no es el que tiene la espada

	if(atacando and collision_npc.flicker_timer == 0) {		
		collision_npc.estado = "golpeado";
		collision_npc.DMG_RECEIVED = int64(random_range(global.controlled_object.SWRD_DMG_LOW, global.controlled_object.SWRD_DMG_HIGH));
	}
	if(!atacando and global.controlled_object.flicker_timer == 0) {
		global.controlled_object.vida_total--;
		global.controlled_object.empujado = true;
	}
}
