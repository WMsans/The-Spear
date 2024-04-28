/// @description 
scr_anim_step();
if(input_check(vk_f2, 1)){
	game_restart();
}

if(global.gamestate != pppgame_states){
	global.gamestate_last = pppgame_states;
	pppgame_states = global.gamestate;
}

if(global.gamestate == game_states.button){
	if(!instance_exists(obj_button_selecter)) instance_create_depth(-999,-999,layers.buttons,obj_button_selecter);
}

if(input_check(vk_f4, 1)){//全屏切换
	if(file_exists("setting.sav")){
		ini_open("setting.sav");
		var nowstate=ini_read_real("graphic","Window Mode",1);
		scr_fullscreen(!nowstate);
		ini_write_real("graphic","Window Mode",!nowstate);
		ini_close();
	}else{
		scr_fullscreen(window_get_fullscreen());
	}
}