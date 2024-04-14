/// @description 
event_inherited();
if(tmp_plot<=global.plot){
	instance_destroy();
}
if(!instance_exists(obj_cutscene)){
	if(place_meeting(x,y,obj_player)){
		scr_create_cutscene(t_scene_info);
	}
}