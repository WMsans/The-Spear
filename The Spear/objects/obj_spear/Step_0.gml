/// @description 
event_inherited();
#region key check
if(!instance_exists(obj_fade) && global.gamestate == game_states.init){
	key_left = input_check(global.keyleft, 0);
	key_right = input_check(global.keyright, 0);
	key_up = input_check(global.keyup, 0);
	key_down = input_check(global.keydown, 0);
	key_jump = input_check(global.keyz, 0);
	key_jump_pressed = input_check(global.keyz, 1);
	key_poke = input_check(global.keyc, 0);
	key_poke_pressed = input_check(global.keyc, 1);
}else{
	key_left=0;
	key_right=0;
	key_up = 0;
	key_down = 0;
	key_jump=0;
	key_jump_pressed=0;
	key_poke = 0;
	key_poke_pressed = 0;
}
#endregion

script_execute(state_machine[spear_state]);
