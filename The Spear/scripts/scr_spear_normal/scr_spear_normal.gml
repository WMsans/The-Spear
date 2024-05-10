function scr_spear_normal(){
	if(!ds_list_empty(hit_objs)) ds_list_clear(hit_objs);
	
	//跟随玩家
	if(!instance_exists(obj_player)){
		instance_destroy();
	}else{
		x = obj_player.x;
		y = obj_player.y;
	}
	//指向鼠标
	if(global.gamestate == game_states.init){
		sprite_index = spr_spear;
		image_speed = 1;
		if(instance_exists(obj_mouse)){
			image_angle = point_direction(x,y,obj_mouse.x,obj_mouse.y);
		}
		if(key_poke_pressed){
			spear_state = SPEAR_STATES.poke;
		}else if(key_attack_pressed && slash_timer <= 0){
			spear_state = SPEAR_STATES.attack;
		}
		slash_timer = max(slash_timer - 1, 0)
	}
}