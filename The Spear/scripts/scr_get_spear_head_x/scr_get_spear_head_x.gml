function scr_get_spear_head_x(){
	if(!instance_exists(obj_spear)) return -999;
	return obj_spear.x + lengthdir_x(sprite_get_width(obj_spear.sprite_index) - sprite_get_xoffset(obj_spear.sprite_index), obj_spear.image_angle);
}

function scr_get_spear_head_y(){
	if(!instance_exists(obj_spear)) return -999;
	return obj_spear.y + lengthdir_y(sprite_get_width(obj_spear.sprite_index) - sprite_get_xoffset(obj_spear.sprite_index), obj_spear.image_angle);
}