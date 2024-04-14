/// @description 
global.gamestate = global.gamestate_last;
with(obj_GAME){
	instance_activate_all();
	if (surface_exists(pause_surf)) surface_free(pause_surf);
	if (buffer_exists(pause_surfbuffer)) buffer_delete(pause_surfbuffer);
}