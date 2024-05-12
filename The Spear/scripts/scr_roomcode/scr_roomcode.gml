function scr_roomcode(){
	scr_fadein();
	global.expecting_textblock_x=-999;
	global.expecting_textblock_y=-999;
	if(!instance_exists(obj_player)){
		instance_create_depth(global.target_x,global.target_y, layers.overworld, obj_player);
		global.nearest_x = global.target_x;
		global.nearest_y = global.target_y;
	}
	if(!instance_exists(obj_camera)){
		instance_create_depth(obj_player.x,obj_player.y,layers.overworld,obj_camera);
	}
	with(obj_camera){
		if(view_w_half * 2 + buff < room_width || view_h_half * 2 + buff < room_height){
			x=clamp(obj_player.x, view_w_half, room_width-view_w_half);
			y=clamp(obj_player.y, view_h_half, room_height-view_h_half);
		}else{
			x=clamp(obj_player.x, view_w_half + buff, room_width-view_w_half - buff);
			y=clamp(obj_player.y, view_h_half + buff, room_height-view_h_half - buff);
		}
		if(scr_get_camera_limit(obj_player) != noone){
			x = clamp(xTo, scr_get_camera_limit(obj_player).bbox_left + view_w_half, scr_get_camera_limit(obj_player).bbox_right - view_w_half);
			y = clamp(yTo, scr_get_camera_limit(obj_player).bbox_top + view_h_half, scr_get_camera_limit(obj_player).bbox_bottom - view_h_half);
		}
	}
	if(!instance_exists(obj_drawsorter)){
		instance_create_depth(-999,-999,layers.overworld,obj_drawsorter);
	}
	if(!instance_exists(obj_health)){
		instance_create_depth(-999,-999,layers.UI, obj_health);	
	}
	if(instance_exists(obj_bgm)){
		obj_bgm.into_new_room = true;
	}
	
	global.gamestate = game_states.init;
}