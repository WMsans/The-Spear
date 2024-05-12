function scr_spear_anchor(){
	if(!ds_list_empty(hit_objs)) ds_list_clear(hit_objs);
	if(pre_anchor_x != - 999) anchor_x = pre_anchor_x;
	if(pre_anchor_y != - 999) anchor_y = pre_anchor_y;
	if(pre_anchor_face != - 999) anchor_face = pre_anchor_face;
	pre_anchor_x = -999;
	pre_anchor_y = -999;
	pre_anchor_face = -999;
	
	if(anchor_x == -999 && anchor_y == -999){
		spear_state = SPEAR_STATES.normal;
		exit;
	}
	if(instance_exists(obj_player) && obj_player.player_state != PLAYER_STATES.anchor){
		obj_player.player_state  =PLAYER_STATES.anchor;
	}
	
	sprite_index = spr_spear;
	image_speed = 1;
	
	
	var tar_angle = point_direction(x,y,anchor_x,anchor_y);
	var tar_x = anchor_x - scr_get_spear_head_x() + obj_spear.x;
	var tar_y = anchor_y - scr_get_spear_head_y() + obj_spear.y;
	
	var _tar_angle = tar_angle;
	
	if(anchor_face == ANCHOR_FACE.right){
		if(key_up - key_down != 0){
			last_dir = key_up - key_down;
			spin_speed = clamp(spin_speed + spin_speed_up * last_dir,-max_spin_speed, max_spin_speed);
		}else{
			spin_speed -= spin_speed_down * last_dir;
			if(abs(spin_speed) < 2) spin_speed = 0;
		}
		_tar_angle += spin_speed ;
	}else if(anchor_face == ANCHOR_FACE.left){
		if(key_down - key_up != 0){
			last_dir = key_down - key_up;
			spin_speed = clamp(spin_speed + spin_speed_up * last_dir,-max_spin_speed, max_spin_speed);
		}else{
			spin_speed -= spin_speed_down * last_dir;
			if(abs(spin_speed) < 2) spin_speed = 0;
		}
		_tar_angle += spin_speed;
	}else if(anchor_face == ANCHOR_FACE.top){
		if(key_left - key_right != 0){
			last_dir = key_left - key_right;
			spin_speed = clamp(spin_speed + spin_speed_up * last_dir,-max_spin_speed, max_spin_speed);
		}else{
			spin_speed -= spin_speed_down * last_dir;
			if(abs(spin_speed) < 2) spin_speed = 0;
		}
		_tar_angle += spin_speed;
	}else{
		if(key_right - key_left != 0){
			last_dir = key_right - key_left;
			spin_speed = clamp(spin_speed + spin_speed_up * last_dir,-max_spin_speed, max_spin_speed);
		}
		else{
			spin_speed -= spin_speed_down * last_dir;
			if(abs(spin_speed) < 2) spin_speed = 0;
		}
		_tar_angle += spin_speed;
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
		tar_y = _tar_y;
	}else{
		spin_speed = 0;
		
	}
	
	image_angle += angle_difference(tar_angle, image_angle) / 3;
	x += (tar_x - x) / 3;
	y += (tar_y - y) / 3;
}