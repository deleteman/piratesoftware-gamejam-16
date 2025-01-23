/// @description movimiento
if direcction = 1{
  sprite_index = caballero;image_speed =0.3;image_xscale = 1;	
}else{
  sprite_index = caballero;image_speed =0.3;image_xscale = -1;
}
//deteccion de parametros de colisio
if not place_free(x+4,y){
 hspeed = izq;
 direcction = 0;
}

if not place_free(x-4,y){
 hspeed = der;
 direcction = 1;
}
