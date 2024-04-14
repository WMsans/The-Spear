/// @description 
event_inherited();
if(tmp_plot!=""&&variable_global_exists(tmp_plot)){
	instance_destroy();
}

if(!instance_exists(obj_cutscene)){
	if(place_meeting(x,y,obj_player)){
		scr_create_cutscene(t_scene_info);
		if(tmp_plot!="") variable_global_set(tmp_plot,1);
		instance_destroy();
	}
}

