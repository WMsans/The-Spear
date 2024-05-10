scr_fadein();
global.gamestate = game_states.button;
if(instance_exists(obj_bgm)){
	obj_bgm.into_new_room = true;
}
if(!instance_exists(obj_button_selecter)) instance_create_depth(-999,-999,layers.buttons,obj_button_selecter);

if(instance_exists(obj_mouse)){
	var view_w_half=camera_get_view_width(view_camera[0])*0.5;
	var view_h_half=camera_get_view_height(view_camera[0])*0.5;
	obj_mouse.x = view_w_half;
	obj_mouse.y = view_h_half;
}