/// @description 
event_inherited();
if(instance_exists(obj_player)){
	if(place_meeting(x,y,obj_player)){
		global.gamestate = game_states.cutscene;
		if(obj_player.player_state == PLAYER_STATES.anchor){
			obj_player.player_state = PLAYER_STATES.normal
			if(instance_exists(obj_spear)) with(obj_spear){
				spear_state = SPEAR_STATES.normal;
				pre_spear_state = SPEAR_STATES.normal;
				
			}
		}
		
		if(target_x != -999 || target_y != -999){
			obj_player.x = target_x;
			obj_player.y = target_y;
			if(instance_exists(obj_spear)){
				obj_spear.x = target_x;
				obj_spear.y = target_y;
			}
		}else{
			obj_player.x = global.nearest_x;
			obj_player.y = global.nearest_y;
			if(instance_exists(obj_spear)){
				obj_spear.x = global.nearest_x;
				obj_spear.y = global.nearest_y;
			}
		}
		global.gamestate = game_states.init;
	}
}
