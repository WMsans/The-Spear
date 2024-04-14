///@arg id
///@arg pos
///@arg val
function scr_cutscene_ds_list_replace(_obj,_id,_pos,_val){
	with(_obj){
		ds_list_replace(_id, _pos, _val);
	}
	scr_cutscene_end_action();
}