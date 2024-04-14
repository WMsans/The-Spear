///@arg obj_name
function scr_cutscene_instance_destroy(_inst){
	with(_inst){
		instance_destroy();
	}
	
	scr_cutscene_end_action();
}