function scr_get_camera_limit(_player_obj = obj_player){
	return collision_point(_player_obj.x, _player_obj.y, obj_camera_limit, false, false);
}