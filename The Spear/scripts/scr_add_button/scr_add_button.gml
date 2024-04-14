function scr_add_button(button_id){
	if(!ds_map_exists(obj_button_selecter.button_groups_by_x, button_id.button_group)){
		ds_map_add(obj_button_selecter.button_groups_by_x, button_id.button_group, []);
	}
	array_push(obj_button_selecter.button_groups_by_x[? button_id.button_group], button_id);
	
	if(!ds_map_exists(obj_button_selecter.button_groups_by_y, button_id.button_group)){
		ds_map_add(obj_button_selecter.button_groups_by_y, button_id.button_group, []);
	}
	array_push(obj_button_selecter.button_groups_by_y[? button_id.button_group], button_id);
	
	if(!ds_map_exists(obj_button_selecter.button_groups_showing, button_id.button_group)){
		ds_map_add(obj_button_selecter.button_groups_showing, button_id.button_group, true);
	}
}

function scr_sort_button_by_x(inst1, inst2){
	if(inst1.x == inst2.x) return inst1.y <= inst2.y;
	return inst1.x <= inst2.x;
}
function scr_sort_button_by_y(inst1, inst2){
	if(inst1.y == inst2.y) return inst1.x <= inst2.x;
	return inst1.y <= inst2.y;
}