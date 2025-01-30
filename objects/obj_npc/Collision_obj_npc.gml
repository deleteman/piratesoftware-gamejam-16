var collision_npc = instance_place(x, y, obj_npc);


if(obj_relic.atacando and collision_npc.flicker_timer == 0) {		
	collision_npc.estado = "golpeado";
	collision_npc.DMG_RECEIVED = int64(random_range(global.controlled_object.SWRD_DMG_LOW, global.controlled_object.SWRD_DMG_HIGH));
}

if(!obj_relic.atacando and controlled and global.controlled_object.flicker_timer == 0) {
	DMG_RECEIVED = collision_npc.NATURAL_DMG;
	estado = "golpeado";
}

