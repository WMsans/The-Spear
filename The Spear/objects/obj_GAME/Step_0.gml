/// @description 
scr_anim_step();
if(keyboard_check_pressed(vk_f2)){
	game_restart();
}

if(global.gamestate != pppgame_states){
	global.gamestate_last = pppgame_states;
	pppgame_states = global.gamestate;
}

if(global.gamestate == game_states.button){
	if(!instance_exists(obj_button_selecter)) instance_create_depth(-999,-999,layers.buttons,obj_button_selecter);
}

