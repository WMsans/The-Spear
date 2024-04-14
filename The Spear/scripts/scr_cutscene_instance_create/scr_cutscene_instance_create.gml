///@arg x
///@arg y
///@arg layer_name
///@arg obj
function scr_cutscene_instance_create(){
	var _inst = instance_create_depth(argument0,argument1,argument2,argument3);
	
	scr_cutscene_end_action();
	return _inst;
}