/// @description 
draw_set_font(fnt_init);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for(var i = 1; i <= global.max_hp; i++){
	draw_sprite(spr_health, (global.hp >= i), x + 120 * (i - 1) + 16, y + 16);
}

x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);