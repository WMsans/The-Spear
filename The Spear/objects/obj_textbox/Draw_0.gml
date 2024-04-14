/// @description 
box_x=camera_get_view_x(view_camera[0]);
box_y=camera_get_view_y(view_camera[0])+448;
accept_key=input_check(global.keyz, 1);
draw_set_alpha(0.75);
if(!input_check(global.keyz, 0)) pressingz=0;

draw_set_font(fnt_init);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
#region setup
if(!setup){
	if(!allow_move) global.gamestate = game_states.cutscene;
	else global.gamestate = game_states.init;
	setup = true;
	if(page_num==0){
		if(instance_exists(obj_textbox_arrow)) instance_destroy(obj_textbox_arrow);
		instance_destroy();
	}
	//read through
	for(var i=0;i<page_num;i++){
		text_len[i]=string_length(text[i]);
		//portrait on left
		text_x_offset[i]=380;
		portrait_x_offset[i]=192;
		
		if(speaker_side[i]==-1){//portrait on right
			text_x_offset[i]=144;
			portrait_x_offset[i]=896;
		}
		if(speaker_spr[i]==noone){
			text_x_offset[i]=144;//No portrait
		}
		//setting breaks
		for(var j=0;j<text_len[i];j++){
			char[j][i]=string_char_at(text[i],j+1);
			var _txt_up_to_char=string_copy(text[i],1,j+1);
			var _current_str_w=string_width(_txt_up_to_char)-string_width(char[j][i]);
			
			if(char[j][i]==" ") { last_free_space = j+2; }
			//get the line breaks
			if(_current_str_w - line_break_offset[i] >  line_w- (speaker_spr[i]!=noone)*272){
				line_break_pos[ line_break_num[i] , i] = last_free_space;
				line_break_num[i]++;
				var _txt_up_to_last_space = string_copy( text[i], 1, last_free_space );
				var _last_free_space_string = string_char_at( text[i], last_free_space );
				line_break_offset[i]=string_width(_txt_up_to_last_space)-string_width(_last_free_space_string);
			}
		}
		//get each char's location
		for(var j=0;j<text_len[i];j++){
			var _txt_x=box_x+text_x_offset[i]+border;
			var _txt_y=box_y+border;
			var _txt_up_to_char=string_copy(text[i],1,j+1);
			var _current_str_w=string_width(_txt_up_to_char)-string_width(char[j][i]);
			var _txt_line=0;
			
			for(var lb=0;lb<line_break_num[i];lb++){
				if( j+1 >= line_break_pos[lb,i] ){//the char is after a line break
					var _str_copy = string_copy( text[i], line_break_pos[lb, i], j+1-line_break_pos[lb, i] );
					_current_str_w=string_width(_str_copy);
					_txt_line=lb+1;
					
				}
			}
			//add to the x and y
			char_x[j][i]=_txt_x+_current_str_w;
			char_y[j][i]=_txt_y+_txt_line*line_sep;
			
		}
	}
	
	
	for(var i=0;i<option_num;i++){//set the options
		option_color[i]=c_white;
	}
	
	
}
#endregion
#region typing
if(text_pause_timer<=0){
if(draw_char<text_len[page]){
	draw_char+=text_spd;
	draw_char=clamp(draw_char,0,text_len[page]);
	
	var _check_char=string_char_at(text[page],draw_char);
	if(_check_char=="."){
		text_pause_timer=text_pause_time;
	}else{//make some sound
		if(sound_ct<sound_delay){
			sound_ct++;
		}else{
			sound_ct=0;
			//play audio
		}
	}
}
}else text_pause_timer--;
#endregion
#region flip pages
if(accept_key){
	if(draw_char==text_len[page]){
		if(page<page_num-1){
			page++;
			draw_char=0;
		}else{
			print_op=max(print_op,1);//options
			if(option_num>0 && print_op==2 && option_pos!=0){//There're options and had ended typing
				scr_create_text(option_link_id[clamp(option_pos-1,0,999)],camx-64,camy);
				chosing=0;
				instance_destroy(obj_textbox_arrow);
				instance_destroy();
			}else if(option_num==0){//there's no options
				if(savebox){//This is a savebox
					instance_create_depth(-999,-999,layers.UI,obj_savebox);
					instance_destroy(obj_textbox_arrow);
					instance_destroy();
				}else{//nothing,just end this
					if(instance_exists(obj_cutscene)){//in a cutscene
						with(obj_cutscene){
							scr_cutscene_end_action()
						}
					}
					instance_destroy(obj_textbox_arrow);
					instance_destroy();
				}
			}
		}
	}else if(!pressingz) draw_char=text_len[page];//end typing this page
}else if(input_check(global.keyx, 1)) draw_char=text_len[page];
#endregion

#region draw the box
if(page_num){
	txtb_img+=txtb_img_spd;
	if(!print_op)
		draw_sprite(txtb_spr[page],txtb_img,box_x+144,box_y);
	else
		draw_sprite(spr_textbox,txtb_img,box_x+144,box_y);
}
#endregion
#region draw the portrait
if(!print_op){//Not printing option
	if(speaker_spr[page]!=noone){//There's a speaker
		sprite_index=speaker_spr[page];
		if(draw_char==text_len[page]) image_index=0;//if it's not talking,stop the animation
		var _speaker_x = portrait_x_offset[page];
		if(speaker_side[page]==-1){_speaker_x+=sprite_width;}//On the right,ready to flip, so add the x to make it right
		//draw the speaker
		draw_sprite_ext(sprite_index,image_index,_speaker_x+box_x-16,box_y,speaker_side[page],1,0,c_white,image_alpha);
	}
}
#endregion
#region draw the txt
if(!print_op){
	
	for(var i=0;i<draw_char;i++){
		//float text
		var _float_y=0;
		if(float_text[i][page]){
			float_dir[i][page] += -6;//the speed
			_float_y=dsin(float_dir[i][page])*4;//the size of the wave
			
		}
		//shake text
		var _shake_x=0;
		var _shake_y=0;
		if(shake_text[i][page]){
			shake_txt_timer[i][page]--;
			if(shake_txt_timer[i][page]<=0){
				shake_txt_timer[i][page]=irandom_range(4,8);
				shake_txt_dir[i][page]=irandom(360);
			}
			_shake_x+=lengthdir_x(1,shake_txt_dir[i][page]);
			_shake_y+=lengthdir_y(1,shake_txt_dir[i][page]);
		}
		
		draw_text_color(char_x[i][page]-_camx+obj_camera.x +_shake_x,char_y[i][page]-_camy+obj_camera.y +_float_y +_shake_y,char[i][page],col_1[i][page],col_2[i][page],col_3[i][page],col_4[i][page],image_alpha);
		
	}

}
else{//print the options
	chosing=1;
	draw_set_font(fnt_init);
	
	/*selection(old)
	option_pos+=input_check(vk_down, 1)-input_check(vk_up,1 );
	option_pos=clamp(option_pos,0,option_num-1);*/
	
	//draw arrow
	if(!instance_exists(obj_textbox_arrow)){
		instance_create_depth(-999,-999,layers.UI - 1,obj_textbox_arrow);
	}
	#region draw options
	var _chosed=0;
	switch(option_num){//how many options are there
		case 1:
			draw_text_color(box_x+640-string_width(option[0])/2,box_y+128-string_height(option[0])/2,option[0],c_yellow,c_yellow,c_white,c_white,1);
			break;
		case 2:
			//selection
			if(input_check(global.keyright, 1)||input_check(global.keyleft, 1)) {
				if(option_pos==0){
					if(input_check(global.keyright, 1)) option_pos=2;
					else option_pos=1;
				}else
					option_pos=clamp((option_pos+1)%3,1,2);
			}
			if(1==option_pos){
				//draw the yellow option
				draw_text_color(box_x+144+border,box_y+128-string_height(option[0])/2,option[0],c_yellow,c_yellow,c_white,c_white,1);
				
			}else{
				draw_text_color(box_x+144+border,box_y+128-string_height(option[0])/2,option[0],option_color1[0],option_color2[0],option_color3[0],option_color4[0],1);
			}
			if(2==option_pos){
				//draw the yellow option
				draw_text_color(box_x+144+992-string_width(option[1])-border,box_y+128-string_height(option[1])/2,option[1],c_yellow,c_yellow,c_white,c_white,1);
			}else{
				draw_text_color(box_x+144+992-string_width(option[1])-border,box_y+128-string_height(option[1])/2,option[1],option_color1[1],option_color2[1],option_color3[1],option_color4[1],1);
			}
			break;
		case 3:
			if(0==option_pos){
				option_pos=2;
			}
			if(1==option_pos){
				if(!_chosed){
				if(input_check(global.keyleft, 1)) {option_pos=3;_chosed=1;}
				if(input_check(global.keyright, 1)) {option_pos=2;_chosed=1;}
				}
				//draw the yellow option
				draw_text_color(box_x+144+border,box_y+128-string_height(option[0])/2,option[0],c_yellow,c_yellow,c_white,c_white,1);
			}else{
				draw_text_color(box_x+144+border,box_y+128-string_height(option[0])/2,option[0],option_color1[0],option_color2[0],option_color3[0],option_color4[0],1);
			}
			if(2==option_pos){
				if(!_chosed){
					if(input_check(global.keyleft, 1)){option_pos=1;_chosed=1;}
					if(input_check(global.keyright, 1)) {option_pos=3;_chosed=1;}
				}
				
				draw_text_color(box_x+640-string_width(option[1])/2,box_y+128-string_height(option[1])/2,option[1],c_yellow,c_yellow,c_white,c_white,1);
			}else{
				draw_text_color(box_x+640-string_width(option[1])/2,box_y+128-string_height(option[1])/2,option[1],option_color1[1],option_color2[1],option_color3[1],option_color4[1],1);
			}
			if(3==option_pos){
				if(!_chosed){
					if(input_check(global.keyleft,1)) {option_pos=2;_chosed=1;}
					if(input_check(global.keyright,1)) {option_pos=1;_chosed=1;}
				}
				//draw the yellow option
				draw_text_color(box_x+144+992-string_width(option[2])-border,box_y+128-string_height(option[2])/2,option[2],c_yellow,c_yellow,c_white,c_white,1);
			}else{
				draw_text_color(box_x+144+992-string_width(option[2])-border,box_y+128-string_height(option[2])/2,option[2],option_color1[2],option_color2[2],option_color3[2],option_color4[2],1);
			}
			
			break;
		case 4:
			if(input_check(global.keyup, 1)){
				option_pos=1;
			}else if(input_check(global.keydown,1 )){
				option_pos=2;
			}
			if(input_check(global.keyleft,1 )){
				option_pos=3;
			}else if(input_check(global.keyright, 1)){
				option_pos=4;
			}
			
			if(1==option_pos){
				draw_text_color(box_x+640-string_width(option[0])/2,box_y+64-string_height(option[0])/2,option[0],c_yellow,c_yellow,c_white,c_white,1);
			}else{
				draw_text_color(box_x+640-string_width(option[0])/2,box_y+64-string_height(option[0])/2,option[0],option_color1[0],option_color2[0],option_color3[0],option_color4[0],1);
			}
			if(2==option_pos){
				draw_text_color(box_x+640-string_width(option[1])/2,box_y+192-string_height(option[1])/2,option[1],c_yellow,c_yellow,c_white,c_white,1);
			}else{
				draw_text_color(box_x+640-string_width(option[1])/2,box_y+192-string_height(option[1])/2,option[1],option_color1[1],option_color2[1],option_color3[1],option_color4[1],1);
			}
			if(3==option_pos){
				draw_text_color(box_x+144+border,box_y+128-string_height(option[2])/2,option[2],c_yellow,c_yellow,c_white,c_white,1);
			}else{
				draw_text_color(box_x+144+border,box_y+128-string_height(option[2])/2,option[2],option_color1[2],option_color2[2],option_color3[2],option_color4[2],1);
			}
			if(4==option_pos){
				draw_text_color(box_x+144+992-string_width(option[3])-border,box_y+128-string_height(option[3])/2,option[3],c_yellow,c_yellow,c_white,c_white,1);
			}else{
				draw_text_color(box_x+144+992-string_width(option[3])-border,box_y+128-string_height(option[3])/2,option[3],option_color1[3],option_color2[3],option_color3[3],option_color4[3],1);
			}
			
			break;
	}
	print_op=2;
	
	/*
	var _op_h=0;
	var _op_gap=48;
	var _c=0;
	for(var i=0;i<option_num;i++){
		_c=0;
		if(i==option_pos){
			_c=1;
			draw_sprite(spr_textbox_arrow,0,box_x+text_x_offset[page]+border,box_y+_op_h+border);
		}
		if(!_c)
			draw_text_color(box_x+text_x_offset[page]+_op_gap+border,box_y+_op_h+border,option[i],option_color1[i],option_color2[i],option_color3[i],option_color4[i],1);
		else{
			draw_text_color(box_x+text_x_offset[page]+_op_gap+border,box_y+_op_h+border,option[i],c_yellow,c_yellow,c_white,c_white,1);
		}
		
		print_op=2;
		_op_h+=string_height(option[i]);
	}*/
	#endregion
}
#endregion

draw_set_alpha(1);