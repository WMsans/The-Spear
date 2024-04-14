///@arg scene_info
function scr_create_cutscene(_scene_info){
	var inst = instance_create_layer(0,0,"Instances",obj_cutscene);
	with(inst){
		scene_info=_scene_info;
		event_user(0);
	}
	return inst;
}