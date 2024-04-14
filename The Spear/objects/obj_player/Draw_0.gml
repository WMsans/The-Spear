/// @description 
draw_self();

if(flashalpha>0){
	shader_set(sh_flash);
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,flashcolor,flashalpha);
	shader_reset();
}