/// @description 
event_inherited();
#region key check

if(!instance_exists(obj_fade) && global.gamestate == game_states.init){
	key_left = input_check(global.keyleft, 0);
	key_right = input_check(global.keyright, 0);
	key_jump = input_check(global.keyz, 0);
	key_jump_pressed = input_check(global.keyz, 1);
	if(key_jump_pressed)
		key_jump_pressed_timer = key_jump_pressed_buffer;
	else
		key_jump_pressed_timer = max(key_jump_pressed_timer - 1, 0);
	
}else{
	key_left=0;
	key_right=0;
	key_jump=0;
	key_jump_pressed=0;
	key_jump_pressed_timer = 0;
}
#endregion

script_execute(state_machine[player_state]);

if(flashalpha>0){
	flashalpha-=0.05;
}
