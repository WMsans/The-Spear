function scr_roomcode(){
	scr_fadein();
	global.expecting_textblock_x=-999;
	global.expecting_textblock_y=-999;
	if(!instance_exists(obj_camera)){
		instance_create_depth(global.target_x,global.target_y,layers.overworld,obj_camera);
	}
	if(!instance_exists(obj_drawsorter)){
		instance_create_depth(-999,-999,layers.overworld,obj_drawsorter);
	}
	if(!instance_exists(obj_player)){
		instance_create_depth(global.target_x,global.target_y, layers.overworld, obj_player);
	}
	if(!instance_exists(obj_item_mainbox)){
		instance_create_depth(-999,-999,layers.UI,obj_item_mainbox);
	}
	if(instance_exists(obj_bgm)){
		obj_bgm.into_new_room = true;
	}
	global.gamestate = game_states.init;
}