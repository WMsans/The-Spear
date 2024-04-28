function scr_player_anchor(){
	if(!instance_exists(obj_spear) || !hold_spear){
		player_state = PLAYER_STATES.normal;
		exit;
	}
	if(key_jump_pressed){
		bounced = false;
		jump_buffer = 0;
		vsp = jump_speed;
		player_state = PLAYER_STATES.normal;
		if(instance_exists(obj_spear)) obj_spear.spear_state = SPEAR_STATES.normal;
	}
	if(!input_check(global.keyc, Input_State.keep)){
		vsp = 0;
		jump_buffer = 5;
		player_state = PLAYER_STATES.normal;
		if(instance_exists(obj_spear)) obj_spear.spear_state = SPEAR_STATES.normal;
	}
	
	//move to the spear's place
	
	var _pixel = sign(obj_spear.x - x);
	while(abs(obj_spear.x - x) >= 2){
		if(scr_touch_block(x + _pixel, y)) break;
		x += _pixel;
	}
	_pixel = sign(obj_spear.y - y);
	while(abs(obj_spear.y - y) >= 2){
		if(scr_touch_block(x, y + _pixel)) break;
		y += _pixel;
	}
}