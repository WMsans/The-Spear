/// @description 
if(instance_exists(obj_block_arrow)){
	x = obj_block_arrow.x;
	y = obj_block_arrow.y;
	image_angle = obj_block_arrow.image_angle;
	instance_destroy(obj_block_arrow);
}
tar_dir = 2;//0 = right, 1 = up, 2 = left, 3 = down
tar_x = -999;
tar_y = -999;
moving_speed = 0.25;
now_selecting_array_x = [];
now_selecting_array_y = [];
now_selecting = noone;

button_groups_by_x = ds_map_create();
button_groups_by_y = ds_map_create();
button_groups_showing = ds_map_create();

#region add obj_button to ds
with(obj_button){
	scr_add_button(id);
}
var group_size = ds_map_size(button_groups_by_x);
var key = ds_map_find_first(button_groups_by_x);
for(var i = 0; i < group_size ; i++){
	array_sort(button_groups_by_x[? key], scr_sort_button_by_x);
	key = ds_map_find_next(button_groups_by_x, key);
}
group_size = ds_map_size(button_groups_by_y)
key = ds_map_find_first(button_groups_by_y);
for(var i = 0; i < group_size ; i++){
	array_sort(button_groups_by_y[? key], scr_sort_button_by_y);
	key = ds_map_find_next(button_groups_by_y, key);
}
#endregion