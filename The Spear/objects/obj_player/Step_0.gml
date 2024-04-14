/// @description 
event_inherited();
#region key check
if(!instance_exists(obj_fade) && global.gamestate == game_states.init){
	key_left = keyboard_check(global.keyleft);
	key_right = keyboard_check(global.keyright);
	key_jump = keyboard_check(global.keyz);
	key_jump_pressed = keyboard_check_pressed(global.keyz);
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
