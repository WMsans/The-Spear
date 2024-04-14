/// @description Options Set Up
global.gamestate = game_states.setting;
with(obj_GAME){
	instance_deactivate_all(1);
	pause_surf = surface_create(resw, resh);
	surface_set_target (pause_surf);
	draw_surface (application_surface,0,0);
	surface_reset_target();
	//Back up this surface to a buffer in case we lose it (screen focus, etc) if (buffer_exists(pause_surfbuffer)) buffer_delete(pause_surfbuffer);
	pause_surfbuffer = buffer_create(resw * resh * 4, buffer_fixed, 1); 
	buffer_get_surface (pause_surfbuffer, pause_surf, 0);
	
}
//create pages
scr_load_setting();


var i=0,array_len=array_length_1d(ds_menu_pages);
repeat(array_len){
	menu_option[i]=0;
	for(var j=0;j<100;j++){
		x_tar_offset[i][j]=0;
		x_offset[i][j]=0;
	}
	i++;
}

mouse_deltv = 0;
mouse_deltv_sum = 0;
mouse_delth = 0;
mouse_delth_sum = 0;
mouse_change_dis = 64;

inputting=false;