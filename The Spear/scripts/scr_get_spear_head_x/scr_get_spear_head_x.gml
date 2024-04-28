function scr_get_spear_head_x(){
	if(!instance_exists(obj_spear)) return -999;
	return obj_spear.x + lengthdir_x(obj_spear.sprite_width - obj_spear.sprite_xoffset, obj_spear.image_angle);
}

function scr_get_spear_head_y(){
	if(!instance_exists(obj_spear)) return -999;
	return obj_spear.y + lengthdir_y(obj_spear.sprite_width - obj_spear.sprite_xoffset, obj_spear.image_angle);
}