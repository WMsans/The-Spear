///@arg x
///@arg y
///@arg obj_name
function scr_cutscene_instance_destroy_nearest(){
	var inst=instance_nearest(argument0,argument1,argument2);
	
	scr_cutscene_instance_destroy(inst);
}