/// @description 
if(global.gamestate != game_states.button || !obj_button_selecter.button_groups_showing[? button_group]){
	tar_scale = 0;
}else
if(selected){
	tar_scale = 1.2;
}else {
	tar_scale = 1;
}

image_xscale += (tar_scale - image_xscale) * changing_speed;
image_yscale += (tar_scale - image_yscale) * changing_speed;

if(place_meeting(x,y,obj_mouse)){
	if(mouse_ready){
		obj_button_selecter.now_selecting.selected = false;
		obj_button_selecter.now_selecting = id;
		selected = true;
		mouse_ready = false;
	}
}else mouse_ready = true;