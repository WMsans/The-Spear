scr_fadein();
global.gamestate = game_states.button;
if(instance_exists(obj_bgm)){
	obj_bgm.into_new_room = true;
}
if(!instance_exists(obj_button_selecter)) instance_create_depth(-999,-999,layers.buttons,obj_button_selecter);