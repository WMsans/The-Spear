draw_set_font(fnt_init);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
//set for the target pos
var box_x = obj_textbox.box_x;
var box_y = obj_textbox.box_y;
var border = obj_textbox.border;

switch(obj_textbox.option_num){
	case 1:
		if(tarx<=0 || tary <= 0){
			tarx=obj_textbox.box_x+640-32;
			tary=obj_textbox.box_y+128-string_height(obj_textbox.option[0])/2;
		}
		break;
	case 2:
		if(scr_pos_in_string(tarx + 32, tary - 32, box_x+144+border, box_y+128-string_height(obj_textbox.option[0])/2, obj_textbox.option[0])){
			obj_textbox.option_pos = 1;
		}else if(scr_pos_in_string(tarx + 32, tary - 32, box_x+144+992-string_width(obj_textbox.option[1])-border, box_y+128-string_height(obj_textbox.option[1])/2, obj_textbox.option[1])){
			obj_textbox.option_pos = 2;
		}
		if(tarx <= 0 || tary <= 0){
			if(obj_textbox.option_pos==0){
				tarx=box_x+640-32;
				tary=box_y+128-string_height(obj_textbox.option[0])/2;
			}
			if(obj_textbox.option_pos==1){
				tarx=box_x+144+string_width(obj_textbox.option[0])/2+border-32;
				tary=box_y+128-string_height(obj_textbox.option[0])/2;
			}
			if(obj_textbox.option_pos==2){
				tarx=box_x+144+992-string_width(obj_textbox.option[1])/2-border-32;
				tary=box_y+128-string_height(obj_textbox.option[1])/2;
			}
		}
		
		break;
	case 3:
		if(scr_pos_in_string(tarx, tary, box_x+144+border, box_y+128-string_height(obj_textbox.option[0])/2, obj_textbox.option[0])){
			obj_textbox.option_pos = 1;
		}else if(scr_pos_in_string(tarx, tary, box_x+640-string_width(obj_textbox.option[1])/2,box_y+128-string_height(obj_textbox.option[1])/2,obj_textbox.option[1] )){
			obj_textbox.option_pos = 2;
		}else if(scr_pos_in_string(tarx, tary, box_x+144+992-string_width(obj_textbox.option[2])-border,box_y+128-string_height(obj_textbox.option[2])/2,obj_textbox.option[2])){
			obj_textbox.option_pos = 3;
		}
		if(tarx <= 0 || tary <= 0){
			if(obj_textbox.option_pos==1){
				tarx=obj_textbox.box_x+144+string_width(obj_textbox.option[0])/2+obj_textbox.border-32;
				tary=obj_textbox.box_y+128-string_height(obj_textbox.option[0])/2;
			}
			if(obj_textbox.option_pos==2){
				tarx=obj_textbox.box_x+640-32;
				tary=obj_textbox.box_y+128-string_height(obj_textbox.option[0])/2;
			}
			if(obj_textbox.option_pos==3){
				tarx=obj_textbox.box_x+144+992-string_width(obj_textbox.option[1])/2-obj_textbox.border-32;
				tary=obj_textbox.box_y+128-string_height(obj_textbox.option[1])/2;
			}
		}
		
		break;
	case 4:
		if(scr_pos_in_string(tarx + 32, tary + 32, box_x+640-string_width(obj_textbox.option[0])/2,box_y+64-string_height(obj_textbox.option[0])/2,obj_textbox.option[0])){
			obj_textbox.option_pos = 1;
		}else if(scr_pos_in_string(tarx + 32, tary + 32, box_x+640-string_width(obj_textbox.option[1])/2,box_y+192-string_height(obj_textbox.option[1])/2,obj_textbox.option[1])){
			obj_textbox.option_pos = 2;
		}else if(scr_pos_in_string(tarx + 32, tary + 32, box_x+144+border,box_y+128-string_height(obj_textbox.option[2])/2,obj_textbox.option[2])){
			obj_textbox.option_pos = 3;
		}else if(scr_pos_in_string(tarx + 32, tary + 32, box_x+144+992-string_width(obj_textbox.option[3])-border,box_y+128-string_height(obj_textbox.option[3])/2,obj_textbox.option[3])){
			obj_textbox.option_pos = 4;
		}
		if(tarx <= 0 || tary <= 0){
			if(obj_textbox.option_pos==0){
				tarx=obj_textbox.box_x+640-32;
				tary=obj_textbox.box_y+128-string_height(obj_textbox.option[0])/2;
			}
			if(obj_textbox.option_pos==1){
				tarx=obj_textbox.box_x+640-32;
				tary=obj_textbox.box_y+64-string_height(obj_textbox.option[0])/2;
			}
			if(obj_textbox.option_pos==2){
				tarx=obj_textbox.box_x+640-32;
				tary=obj_textbox.box_y+192-string_height(obj_textbox.option[1])/2;
			}
			if(obj_textbox.option_pos==3){
				tarx=obj_textbox.box_x+144+string_width(obj_textbox.option[0])/2+obj_textbox.border-32;
				tary=obj_textbox.box_y+128-string_height(obj_textbox.option[0])/2;
			}
			if(obj_textbox.option_pos==4){
				tarx=obj_textbox.box_x+144+992-string_width(obj_textbox.option[1])/2-obj_textbox.border;
				tary=obj_textbox.box_y+128-string_height(obj_textbox.option[1])/2;
			}
		}
		
		break;
}
//animate the moving
if(x==-999||y==-999){
	x=tarx;
	y=tary;
}else{
	x+=(tarx-x)/3;
	y+=(tary-y)/3;
}