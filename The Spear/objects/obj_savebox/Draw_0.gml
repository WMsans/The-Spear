/// @description 
if(!init){
	global.gamestate = game_states.saving;
}
box_x=camera_get_view_x(view_camera[0]);
box_y=camera_get_view_y(view_camera[0]);
x=box_x+camera_get_view_width(view_camera[0])/2;
y=box_y+camera_get_view_height(view_camera[0])/2;
mouse_deltv = 0;
mouse_delth = 0;
if(arrow_tarx <= 0) arrow_tarx = x-256;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_init);

draw_self();

/*if(arrow_pos==0){
	arrow_tarx=x;
	arrow_tary=y;
	draw_text_color(x-256,y+164,"Save",c_white,c_white,c_white,c_white,1);
	draw_text_color(x+184,y+164,"Return to game",c_white,c_white,c_white,c_white,1);
}else */
if(arrow_pos==1){
	//arrow_tarx=x-256;
	draw_text_color(x-256,y+164,"Save",c_yellow,c_yellow,c_white,c_white,1);
	draw_text_color(x+184,y+164,"Return to game",c_white,c_white,c_white,c_white,1);
}else if(arrow_pos==2){
	//arrow_tarx=x+184;
	draw_text_color(x-256,y+164,"Save",c_white,c_white,c_white,c_white,1);
	draw_text_color(x+184,y+164,"Return to game",c_yellow,c_yellow,c_white,c_white,1);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(x-sprite_width/2+border,y-sprite_height/2+border, string_copy(room_get_name(room), 4, string_length(room_get_name(room)) - 3) );

//selection
/*if(arrow_pos==0){
	if(input_check(global.keydown, 1)||input_check(global.keyleft,1 )){
		arrow_pos=1;
	}
	if(input_check(global.keyright, 1)){
		arrow_pos=2;
	}
}else */
if(arrow_pos==1){
	
	if(input_check(global.keyright, 1)){
		arrow_pos=2;
	}
	if(input_check(global.keyz, 1)){//Save game
		global.checkpoint_rm=room;
		global.checkpoint_x=obj_player.x;
		global.checkpoint_y=obj_player.y;
		scr_savegame();
		scr_create_text("saved");
		instance_destroy();
	}
}else if(arrow_pos==2){
	if(input_check(global.keyleft, 1)){
		arrow_pos=1;
	}
	if(input_check(global.keyz, 1)){//rm goto title
		instance_destroy();
	}
}

//arrow animate
	//set the img
arrow_img=(arrow_img + 45/60)%27;
	//animate location
if(arrow_x==-999||arrow_y==-999){
	arrow_x=arrow_tarx;
	arrow_y=arrow_tary;
}
arrow_x+=(arrow_tarx-arrow_x)/4;
arrow_y+=(arrow_tary-arrow_y)/4;
	//draw the arrow
draw_sprite_ext(spr_mouse,arrow_img,arrow_x,arrow_y,1,1,0,c_white,0.7);