/// @description 
if(global.gamestate != game_states.setting) exit;
draw_set_font(fnt_init);
draw_set_color(c_white);

var ds_grid=ds_menu_pages[page],ds_height=ds_grid_height(ds_grid);
var x_buffer=32,y_buffer=string_height("K");
var start_y=y-((((ds_height-1)/2)*y_buffer)),start_x=x;

draw_self();

//draw text on the left
draw_set_halign(fa_right);
draw_set_valign(fa_middle);
var ltx=start_x-x_buffer ,lty;
for(var yy=0;yy<ds_height;yy++){
	lty=start_y+(yy*y_buffer);
	var c=c_white;
	if(yy=menu_option[page]){
		c=c_yellow;
		x_tar_offset[page][yy]=-32;
	}else if(ds_grid[# 0, yy] == "Back to title" && room==rm_title){
		c=c_dkgray;
	}
	else{
		x_tar_offset[page][yy]=0;
	}
	x_offset[page][yy]+=(x_tar_offset[page][yy]-x_offset[page][yy])/5;//animate
	draw_text_color(ltx+x_offset[page][yy],lty,ds_grid[# 0, yy],c,c,c_white,c_white,1);
	
	if(abs(scr_mouse_deltx()) || abs(scr_mouse_delty())){
		if(point_in_rectangle(mouse_x - camera_get_view_x(view_camera[0]), mouse_y- camera_get_view_y(view_camera[0]), ltx+x_offset[page][yy] - string_width(ds_grid[# 0, yy]), lty - string_height(ds_grid[# 0, yy]) / 2, ltx+x_offset[page][yy], lty + string_height(ds_grid[# 0, yy]) / 2)){
			if not (ds_grid[# 0, yy] == "Back to title" && room==rm_title)
			menu_option[page] = yy;
		}
	}
}

//draw a line
draw_line(start_x,start_y-y_buffer,start_x,lty+y_buffer);
//draw text on the right
draw_set_halign(fa_left);
var rtx=start_x+x_buffer ,rty;
for(var yy=0;yy<ds_height;yy++){
	rty=start_y+(yy*y_buffer);
	
	switch(ds_grid[# 1,yy]){
		case element_type.shift:
			var current_val=ds_grid[# 3, yy];
			var current_array=ds_grid[# 4, yy];
			var left_shift="<< ",right_shift=" >>";
			
			if(current_val==0)left_shift="";
			if(current_val==array_length_1d(ds_grid[# 4,yy])-1)right_shift="";
			
			if(inputting&&yy=menu_option[page]) c=c_yellow;
			else c=c_white;
			draw_text_color(rtx,rty,left_shift+current_array[current_val]+right_shift,c,c,c_white,c_white,1);
			
			break;
		case element_type.slider:
			var len=256;
			var current_val=ds_grid[# 3, yy];
			var current_array=ds_grid[# 4, yy];
			var circle_pos=(current_val-current_array[0])/(current_array[1]-current_array[0]);
			var c=c_white;
			if(inputting&&yy=menu_option[page]) c=c_yellow;
			else c=c_white;
			
			draw_line_width(rtx,rty,rtx+len,rty,8);
			draw_circle_color(rtx+circle_pos*len,rty,16,c_white,c,false);
			draw_text_color(rtx+(1.2*len),rty,string(floor(current_val*100))+"%",c,c,c_white,c_white,1);
			
			break;
		case element_type.toggle:
			var current_val=ds_grid[# 3, yy];
			var c1,c2,c=c_white;
			if(inputting&&yy=menu_option[page]) c=c_yellow;
			else c=c_white;
			if(current_val){
				c1=c_dkgray;
				c2=c;
			}else{
				c1=c;
				c2=c_dkgray;
			}
			var text_to_draw=ds_grid[# 4,yy];
			draw_text_color(rtx,rty,text_to_draw[0],c1,c1,c_white,c_white,1)
			draw_text_color(rtx+128,rty,text_to_draw[1],c2,c2,c_white,c_white,1)
			
			break;
		case element_type.input:
			var current_val = keychecks(ds_grid[# 3, yy]);
			
			var c = c_white;
			if(inputting and yy == menu_option[page]){ c = c_yellow; }
			draw_text_color(rtx, rty, current_val, c,c,c_white,c_white, 1);

		break;
	}
}

draw_set_valign(fa_top);