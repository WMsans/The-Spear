if(!instance_exists(obj_cutscene) || (instance_exists(obj_cutscene) && obj_cutscene.camera_follow)){
	if(instance_exists(follow)){
		if(view_w_half * 2 + buff < room_width || view_h_half * 2 + buff < room_height){
			xTo=clamp(follow.x, view_w_half, room_width-view_w_half);
			yTo=clamp(follow.y, view_h_half, room_height-view_h_half);
		}else{
			xTo=clamp(follow.x, view_w_half + buff, room_width-view_w_half - buff);
			yTo=clamp(follow.y, view_h_half + buff, room_height-view_h_half - buff);
		}
		if(scr_get_camera_limit(follow) != noone){
			xTo = clamp(xTo, scr_get_camera_limit(follow).bbox_left + view_w_half, scr_get_camera_limit(follow).bbox_right - view_w_half);
			yTo = clamp(yTo, scr_get_camera_limit(follow).bbox_top + view_h_half, scr_get_camera_limit(follow).bbox_bottom - view_h_half);
		}
	}
}
#region Shake
x+=random_range(-shake_remain,shake_remain);
y+=random_range(-shake_remain,shake_remain);
shake_remain = max(0, shake_remain-((1/shake_length)*shake_magnitude));
#endregion
#region layer shake
var len = ds_list_size(layer_shake_layer);
for(var i = 0; i < len; i++){
	layer_x(layer_shake_layer[| i], layer_get_x(layer_shake_layer[| i])+random_range(-layer_shake_remain[| i],layer_shake_remain[| i]));
	layer_y(layer_shake_layer[| i], layer_get_y(layer_shake_layer[| i])+random_range(-layer_shake_remain[| i],layer_shake_remain[| i]));
	layer_shake_remain[| i] = max(0, layer_shake_remain[| i]-((1/layer_shake_length[| i])*layer_shake_magnitude[| i]));
	layer_x(layer_shake_layer[| i],layer_get_x(layer_shake_layer[| i])+(0-layer_get_x(layer_shake_layer[| i]))/cam_speed);
	layer_y(layer_shake_layer[| i],layer_get_y(layer_shake_layer[| i])+(0-layer_get_y(layer_shake_layer[| i]))/cam_speed);
	if(layer_shake_remain[| i] <= 1){
		layer_x(layer_shake_layer[| i],0);
		layer_y(layer_shake_layer[| i],0);
		ds_list_delete(layer_shake_length,i);
		ds_list_delete(layer_shake_magnitude,i);
		ds_list_delete(layer_shake_remain,i);
		ds_list_delete(layer_shake_layer,i);
		i--;len--;
	}
}
#endregion

//Update obj pos
x += (xTo - x) / cam_speed;
y += (yTo - y) / cam_speed;

hsp = x - xprevious;
vsp = y - yprevious;

//Update cam pos
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);