function scr_spear_anchor(){
	if(!ds_list_empty(hit_objs)) ds_list_clear(hit_objs);
	if(instance_exists(obj_player) && obj_player.player_state != PLAYER_STATES.anchor){
		obj_player.player_state  =PLAYER_STATES.anchor;
	}
	sprite_index = spr_spear;
	image_speed = 1;
	
	
	var tar_angle = point_direction(x,y,anchor_x,anchor_y);
	var tar_x = anchor_x - lengthdir_x(sprite_get_width(sprite_index) - sprite_get_xoffset(sprite_index), image_angle);
	var tar_y = anchor_y - lengthdir_y(sprite_get_width(sprite_index) - sprite_get_xoffset(sprite_index), image_angle);
	
	var _tar_angle = tar_angle;
	
	if(anchor_face == ANCHOR_FACE.right){
		_tar_angle += spin_speed * (key_up - key_down);
	}else if(anchor_face == ANCHOR_FACE.left){
		_tar_angle += spin_speed * (key_down - key_up);
	}else if(anchor_face == ANCHOR_FACE.top){
		_tar_angle += spin_speed * (key_left - key_right);
	}else{
		_tar_angle += spin_speed * (key_right - key_left);
	}
	
	var _tar_x = anchor_x - lengthdir_x(sprite_get_width(sprite_index) - sprite_get_xoffset(sprite_index), _tar_angle);
	var _tar_y = anchor_y - lengthdir_y(sprite_get_width(sprite_index) - sprite_get_xoffset(sprite_index), _tar_angle);
	
	var _flag = false;
	with(obj_player){
		_flag = scr_touch_block(_tar_x, _tar_y);
	}
	if(!_flag){
		tar_angle = _tar_angle;
		tar_x = _tar_x;
		tar_y = _tar_y
	}
	
	image_angle += angle_difference(tar_angle, image_angle) / 3;
	x += (tar_x - x) / 3;
	y += (tar_y - y) / 3;
	
	
}