/// @description 
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_button);
if(instance_exists(obj_camera)){
draw_sprite_ext(sprite_index, image_index, x + obj_camera.x - obj_camera.view_w_half, y + obj_camera.y - obj_camera.view_h_half,image_xscale, image_yscale, image_angle, image_blend, image_alpha);

draw_text_transformed_colour(x + obj_camera.x - obj_camera.view_w_half, y + obj_camera.y - obj_camera.view_h_half, display_text , image_xscale, image_yscale, image_angle, display_text_color, display_text_color, display_text_color, display_text_color, image_alpha);
}else{

draw_self();


draw_text_transformed_colour(x, y, display_text, image_xscale, image_yscale, image_angle, display_text_color, display_text_color, display_text_color, display_text_color, image_alpha);

}