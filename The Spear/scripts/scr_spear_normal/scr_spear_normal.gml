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
	sprite_index = spr_spear;
	image_speed = 1;
	if(instance_exists(obj_mouse)){
		image_angle = point_direction(x,y,obj_mouse.x,obj_mouse.y);
	}
	if(key_poke_pressed && global.gamestate == game_states.init){
		spear_state = SPEAR_STATES.poke;
		sprite_index = spr_spear_attack;
		image_index = 0;
	}
}